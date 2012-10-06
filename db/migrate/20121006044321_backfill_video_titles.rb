require 'net/http'

class BackfillVideoTitles < ActiveRecord::Migration
  def up
    Person.all.each do |person|
     update(person)
    end
  end

  def update(person)
    limit  = 50
    offset = 1

    catch(:break) do
      loop do
        videos = get_videos(person, limit, offset)

        throw(:break) if videos.none?

        videos.each do |video|
          key = video['group']['videoid']
          title = video['title']

          Video.find_by_key(key).update_attributes! title: title
        end

        offset = offset + limit
      end
    end
  end

  def get_videos(person, limit, offset)
    uri = URI.parse("http://gdata.youtube.com/feeds/api/users/#{person.username}/favorites?v=2&max-results=#{limit}&start-index=#{offset}")
    response = Net::HTTP.get_response(uri).body
    Hash.from_xml(response)['feed']['entry'] || []
  end
end

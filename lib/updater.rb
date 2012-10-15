require 'net/http'

class Updater
  class << self
    def perform
      Person.all.each do |person|
       update(person)
       remove_videos_that_cant_be_embedded(person) 
      end
    end

    def update(person)
      limit  = 50
      offset = 1
      latest = person.favorites.first.try(:created_at)

      catch(:break) do
        loop do
          videos = get_videos(person, limit, offset)

          throw(:break) if videos.none?

          videos.each do |video|
            key = video['group']['videoid']
            title = video['title']
            created_at = video['published']

            throw(:break) if (latest && latest >= created_at)

            person.favorites.create(key: key, title: title, created_at: created_at)
          end

          offset = offset + limit
        end
      end
    end

    def remove_videos_that_cant_be_embedded(person)

      uri = URI.parse("http://gdata.youtube.com/feeds/api/users/#{person.username}/favorites?v=2")
      response = Net::HTTP.get_response(uri).body
      all_videos = Hash.from_xml(response)['feed']['entry'] || []    

      uri = URI.parse("http://gdata.youtube.com/feeds/api/users/#{person.username}/favorites?v=2&format=5")
      response = Net::HTTP.get_response(uri).body
      all_videos_that_can_be_embedded = Hash.from_xml(response)['feed']['entry'] || []    
      all_videos_that_cant_be_embedded = all_videos - all_videos_that_can_be_embedded
      puts all_videos
      puts all_videos_that_cant_be_embedded

      all_videos_that_cant_be_embedded.each do |video|


      person.videos(video['group']['videoid']).destroy
      
      end
        
    end




    def get_videos(person, limit, offset)
      uri = URI.parse("http://gdata.youtube.com/feeds/api/users/#{person.username}/favorites?v=2&max-results=#{limit}&start-index=#{offset}&format=5")
      response = Net::HTTP.get_response(uri).body
      Hash.from_xml(response)['feed']['entry'] || []
    end
  end
end

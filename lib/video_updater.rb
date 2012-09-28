require 'net/http'

class VideoUpdater
  class << self
    def perform
      Person.all.each do |person|
       update_favorites_for(person)
      end
    end

    # Add favorites/videos since the last run using the YouTube API v2.0
    # https://developers.google.com/youtube/2.0/developers_guide_protocol
    def update_favorites_for(person)
      limit  = 50
      offset = 1
      latest = person.favorites.first.try(:created_at)

      catch(:break) do
        loop do
          uri = URI.parse("http://gdata.youtube.com/feeds/api/users/#{person.username}/favorites?v=2&max-results=#{limit}&start-index=#{offset}")
          response = Net::HTTP.get_response(uri).body
          videos = Hash.from_xml(response)['feed']['entry']

          throw(:break) if videos.nil?

          videos.each do |video|
            key = video['group']['videoid']
            created_at = video['published']

            throw(:break) if (latest && latest >= created_at)

            person.favorites.create(key: key, created_at: created_at)
          end

          offset = offset + limit
        end
      end
    end
  end
end

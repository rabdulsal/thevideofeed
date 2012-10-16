require 'net/http'

class Cleaner
  class << self
    def perform
      Person.all.each do |person|
       remove_videos_that_cant_be_embedded(person) 
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

      all_videos_that_cant_be_embedded.each do |video|
        person.videos(video['group']['videoid']).destroy
      end
    end
  end
end
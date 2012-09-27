class VideoPoster
  class << self
    def perform
      Person.all.each { |person| get(person) }
    end

    def get(person)
      begin
        page ||= 0
        results = YouTubeIt::Client.new.videos_by(:favorites, user: person.username, page: page += 1)
        results.videos.each do |video|
          person.posts.create(key: video.unique_id, created_at: video.published_at)
        end
      end while results.next_page.present?
    end
  end
end

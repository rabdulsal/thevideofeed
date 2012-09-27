class VideoPoster
  class << self
    def perform
      Person.all.each { |person| get(person) }
    end

    def get(person)
      begin
        page ||= 0
        results = YouTubeIt::Client.new.videos_by(:favorites, user: person.username, page: page += 1)
        results.videos.each { |v| person.posts.create(key: v.unique_id, created_at: v.published_at) }
      end while results.next_page.present?
    end
  end
end

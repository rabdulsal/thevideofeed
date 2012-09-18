class VideoPoster
  class << self
    def perform
      Person.all.each { |person| get(person) }
    end

    def get(person)
      page = 0

      begin
        results = YouTubeIt::Client.new.videos_by(:favorites, user: person.username, page: page += 1)
        results.videos.map(&:unique_id).each { |key| person.post(key) }
      end while results.next_page.present?
    end
  end
end

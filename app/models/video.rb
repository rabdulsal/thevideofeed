class Video < ActiveRecord::Base
  validates_uniqueness_of :key

  class << self
    def populate(username)
      page = 0

      while results = YouTubeIt::Client.new.videos_by(:favorites, user: username, page: page += 1)
        results.videos.map(&:unique_id).each { |key| find_or_create_by_key(key) }
        break if results.next_page.nil?
      end
    end
  end

  def to_s
    "<iframe width='560' height='315' src='http://www.youtube.com/embed/#{key}' frameborder='0' allowfullscreen></iframe>".html_safe
  end
end

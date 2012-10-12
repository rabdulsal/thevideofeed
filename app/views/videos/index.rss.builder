xml.instruct! :xml, version: "1.0"
xml.rss version: "2.0" do
  xml.channel do
    xml.title "The Video Feed"
    xml.link root_url

    Video.order("created_at desc").includes(:first_person).limit(30).each do |video|
      xml.item do
        xml.title "#{video.title} from #{video.first_person.name}"
        xml.description video_link(video)
        xml.pubDate video.created_at.to_s(:rfc822)
      end
    end
  end
end

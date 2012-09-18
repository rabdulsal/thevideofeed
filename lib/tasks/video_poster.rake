task :video_poster => :environment do
  VideoPoster.perform
end

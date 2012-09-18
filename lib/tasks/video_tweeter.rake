task :video_tweeter => :environment do
  VideoTweeter.perform
end

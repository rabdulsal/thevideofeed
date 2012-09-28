task :video_updater => :environment do
  VideoUpdater.perform
end

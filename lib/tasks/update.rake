task :update => :environment do
  Updater.perform
end

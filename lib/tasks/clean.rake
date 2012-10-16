task :update => :environment do
  Cleaner.perform
end
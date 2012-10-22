task :update => :environment do
  Pinger.perform
end

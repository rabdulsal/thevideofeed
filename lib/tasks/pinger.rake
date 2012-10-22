task :ping => :environment do
  Pinger.perform
end

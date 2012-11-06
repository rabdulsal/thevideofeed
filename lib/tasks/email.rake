task :email => :environment do
  if Time.now.in_time_zone("Central Time (US & Canada)").hour == 17 # 5pm central
    Emailer.perform
  end
end

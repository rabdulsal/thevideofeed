task :email => :environment do
  Emailer.perform
end

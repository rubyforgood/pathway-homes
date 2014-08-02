namespace :email_digest do
  task :deliver => :environment do
    EmailDigestDelivery.deliver_latest
  end
end

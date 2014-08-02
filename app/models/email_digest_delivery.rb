class EmailDigestDelivery < ActiveRecord::Base
  DELIVERY_FREQUENCY = 1.day

  def self.deliver_latest
    last_digest      = self.order(:delivered_at).last
    last_digest_time = (last_digest && last_digest.delivered_at) || Time.at(0)
    now              = Time.now

    if (last_digest_time + DELIVERY_FREQUENCY) <= now
      recipients       = User.admin.map(&:email)
      service_requests = ServiceRequest.where(created_at: last_digest_time...now).order_by(:created_at)

      EmailDigest.digest(
        recipients: recipients,
        last_digest_time: last_digest_time,
        service_requests: service_requests,
      ).deliver

      new(delivered_at: now).save!
    end
  end
end

class EmailDigestDelivery < ActiveRecord::Base
  TIME_ZONE       = "Eastern Time (US & Canada)"
  DELIVERY_HOUR   = 15
  DELIVERY_MINUTE = 30

  def self.deliver_latest
    last_digest      = self.order(:delivered_at).last
    last_digest_time = ((last_digest && last_digest.delivered_at) || Time.at(0)).in_time_zone(TIME_ZONE)
    last_digest_date = last_digest_time.to_date

    now              = Time.now.in_time_zone(TIME_ZONE)
    today            = now.to_date
    delivery_time    = now.change(hour: DELIVERY_HOUR, min: DELIVERY_MINUTE)

    # if the email hasn't been delivered 'today' and it's past the
    # [DELIVERY_HOUR, DELIVERY_MINUTE], send the email
    if today > last_digest_date && now >= delivery_time
      recipients       = User.admin.map(&:email)
      service_requests = ServiceRequest.where(created_at: last_digest_time...now).order(:created_at)

      EmailDigest.digest(
        last_digest_time: last_digest_time,
        service_requests: service_requests,
      ).deliver

      new(delivered_at: now).save!
    end
  end
end

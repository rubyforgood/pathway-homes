class EmailDigest < ActionMailer::Base
  DIGEST_DESTINATION = "maintenance-digest@pathwayhomes.org"

  # Creates an email digest
  #
  # last_digest_time: the last time the email digest was sent, or `nil` if the
  #   digest has never been sent before
  # service_requests: an array of `ServiceRequest` objects to include in the
  #   digest
  def digest(last_digest_time:, service_requests:)
    @last_digest_time = last_digest_time
    @service_requests = service_requests

    mail to: DIGEST_DESTINATION, subject: "Daily Maintenance Request Digest"
  end
end

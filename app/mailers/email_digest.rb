class EmailDigest < ActionMailer::Base
  # Creates an email digest
  #
  # recipients: the recipients for the email digest (will be bcc'ed on the
  #   email)
  # last_digest_time: the last time the email digest was sent, or `nil` if the
  #   digest has never been sent before
  # service_requests: an array of `ServiceRequest` objects to include in the
  #   digest
  def digest(recipients:, last_digest_time:, service_requests:)
    @last_digest_time = last_digest_time
    @service_requests = service_requests

    mail bcc: recipients, subject: "Daily Maintenance Request Digest"
  end
end

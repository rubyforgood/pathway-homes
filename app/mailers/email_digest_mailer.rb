class EmailDigestMailer < ActionMailer::Base
  # Creates an email digest
  #
  # last_digest_time: the last time the email digest was sent, or `nil` if the
  #   digest has never been sent before
  # service_requests: an array of `ServiceRequest` objects to include in the
  #   digest
  def digest(last_digest_time:, service_requests:)

  end
end

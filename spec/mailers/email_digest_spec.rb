require "rails_helper"

RSpec.describe EmailDigest, :type => :mailer do
  it "creates a digest summarizing the service requests submitted for the day" do
    requests = [
      create(:service_request, community_name: "Community 1"),
      create(:service_request, community_name: "Community 2"),
    ]

    email = EmailDigest.digest(
      recipients:        ["admin@example.com"],
      last_digest_time:  Time.utc(2014, 1, 1, 12, 23),
      service_requests:  requests
    )

    expect(email.bcc).to match_array(["admin@example.com"])
    expect(email.body.to_s).to include "2014-01-01 12:23"
    expect(email.body.to_s).to include "Community 1"
    expect(email.body.to_s).to include "Community 2"
  end
end

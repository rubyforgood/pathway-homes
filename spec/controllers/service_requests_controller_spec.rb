require "rails_helper"

describe ServiceRequestsController, :type => :controller do
  describe "POST #create" do
    it "accepts valid JSON for a service request, returning 201 Created" do
      post :create, service_request: {
        :community_name           => "Paragon Homes",
        :community_street_address => "1234 Paragon Street",
        :community_zip_code       => "12345",
        :client_name              => "Joe Smith",
        :client_phone             => "770-123-4567",
        :client_email             => "joe@example.com",
        :apt_number               => "100",
        :work_desc                => "Description",
        :alarm                    => false,
      }, format: "json"

      expect(response.status).to eq(201)
    end
  end
end

require "rails_helper"

describe ServiceRequestsController, :type => :controller do
  render_views
  before { sign_in create(:user, :admin) }

  describe "POST #create" do
    it "accepts valid JSON for a service request, returning 201 Created" do
      post :create, service_request: {
        :community_name           => "Paragon Homes",
        :community_street_address => "1234 Paragon Street",
        :community_zip_code       => "12345",
        :apt_number               => "100",
        :work_desc                => "Description",
        :alarm                    => false,
        :pet                      => true,
        :authorized_to_enter      => true,
      }, format: "json"

      expect(response.status).to eq(201)
      json = JSON.parse(response.body)
      expect(json["community_name"]).to eq("Paragon Homes")
    end

    it "responds with errors for invalid or missing parameters" do
      post :create, service_request: {
        :community_name => "",
      }, format: "json"

      expect(response.status).to eq(422)
      json = JSON.parse(response.body)
      expect(json["community_name"]).to include("can't be blank")
    end
  end

  describe "PATCH #update" do
    it "accepts valid JSON for a service request, returning 200 OK" do
      service_request = create(:service_request)
      patch :update, id: service_request.id, service_request: {
        community_name: "Perfect Homes",
      }, format: "json"

      expect(response.status).to eq(200)
      json = JSON.parse(response.body)
      expect(json["community_name"]).to eq("Perfect Homes")
    end
  end
end

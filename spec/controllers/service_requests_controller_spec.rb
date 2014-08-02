require "rails_helper"

describe ServiceRequestsController, :type => :controller do
  render_views
  before { sign_in create(:user, :admin) }

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

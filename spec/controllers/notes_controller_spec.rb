require "rails_helper"

describe NotesController, :type => :controller do
  render_views
  let(:current_user) { create(:user, :admin) }
  before { sign_in current_user }

  describe "POST #create" do
    it "creates a note for a service request" do
      service_request = create(:service_request)
      post :create, service_request_id: service_request.id, note: {
        note: "Replaced a seal on the toilet's tank",
      }, format: "json"

      expect(response.status).to eq(201)
      json = JSON.parse(response.body)
      expect(json["note"]).to eq("Replaced a seal on the toilet's tank")
      expect(json["user"]["id"]).to eq(current_user.id)
      expect(json["service_request_id"]).to eq(service_request.id)
    end
  end
end

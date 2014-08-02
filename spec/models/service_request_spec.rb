require 'rails_helper'

RSpec.describe ServiceRequest, :type => :model do
  describe "status transitions" do
    it "initially, has the 'open' status" do
      service_request = create(:service_request, :open)

      expect(service_request.assignee).to be_nil
      expect(service_request.assigned_at).to be_nil
      expect(service_request.status).to eq("open")
    end

    it "transitions from 'open' to 'assigned' when a worker is assigned" do
      service_request = create(:service_request, :open)

      worker = create(:user, :maintenance)
      service_request.assignee = worker
      service_request.save!

      expect(service_request.assignee).to eq(worker)
      expect(service_request.assigned_at).to be_within(1.second).of(Time.now)
      expect(service_request.status).to eq("assigned")
    end
  end
end

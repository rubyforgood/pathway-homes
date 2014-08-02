require 'rails_helper'

RSpec.describe ServiceRequest, :type => :model do
  describe "status transitions" do
    it "initially, has the 'open' status" do
      service_request = create(:service_request)

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

    it "transitions from 'assigned' to 'in progress'" do
      service_request = create(:service_request, :open)
      worker = create(:user, :maintenance)
      service_request.assignee = worker
      service_request.save!
      expect(service_request.status).to eq("assigned")

      service_request.status = "in_progress"
      service_request.save!
      expect(service_request.status).to eq("in_progress")
    end

    it "transitions from 'in progress' to 'closed'" do
      service_request = create(:service_request, :in_progress)

      service_request.status = "closed"
      service_request.save!
      expect(service_request.status).to eq("closed")
      expect(service_request.closed_at).to be_within(1.second).of(Time.now)
    end
  end
end

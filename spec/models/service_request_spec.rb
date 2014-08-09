require 'rails_helper'

RSpec.describe ServiceRequest, :type => :model do
  describe "status transitions" do
    it "initially, has the 'open' status" do
      service_request = create(:service_request)

      expect(service_request.status).to eq("open")
    end

    it "transitions from 'open' to 'in progress'" do
      service_request = create(:service_request, :open)

      service_request.status = "in_progress"
      service_request.save!
      expect(service_request.status).to eq("in_progress")
    end

    it "transitions from 'in progress' to 'closed'" do
      service_request = create(:service_request, :in_progress)

      service_request.status = "closed"
      service_request.save!
      expect(service_request.status).to eq("closed")
    end
  end
end

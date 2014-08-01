class ServiceRequestsController < ApplicationController
  def new
  end

  def edit
  end

  def create
    @service_request = ServiceRequest.new(service_request_params)
    respond_to do |format|
      if @service_request.save!
        format.json { render action: "show", status: :created }
      end
    end
  end

  def show
  end	

  private
  def service_request_params
    params.require(:service_request).permit(
      :community_name, :client_name, :client_phone, :client_email, :apt_number,
      :work_desc, :special_instructions, :alarm, :community_street_address,
      :community_zip_code, :pet
    )
  end
end

class ServiceRequestsController < ApplicationController

  def index
    @service_requests = ServiceRequest.all
    
    respond_to do |format|
      format.html
      format.csv { render text: @service_requests.to_csv }
    end
  end

  def new
  end

  def edit
  end

  def create
    @service_request = ServiceRequest.new(service_request_params)
    respond_to do |format|
      if @service_request.save
        format.json { render action: "show", status: :created }
      else
        format.json { render json: @service_request.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end 
  
  def export
    
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

class ServiceRequestsController < ApplicationController
  rescue_from ActionController::ParameterMissing, with: :handle_missing_parms

  def index
    @service_requests = ServiceRequest.all
  end

  def new
    @service_request = ServiceRequest.new
  end

  def edit
    @service_request = ServiceRequest.find_by_id(params[:id])
  end

  def create
    @service_request = ServiceRequest.new(service_request_params)
    @service_request.creator = current_user

    respond_to do |format|
      if @service_request.save
        ServiceRequestMailer.creator_confirmation(@service_request).deliver

        flash[:notice] = "Request ##{@service_request.id} was created!"
        format.html { redirect_to @service_request }
      else
        flash[:alert] = @service_request.errors.full_messages.join('. ')
        format.html { render action: "new" }
      end
    end
  end

  def update
    @service_request = ServiceRequest.find_by_id(params[:id])

    respond_to do |format|
      if @service_request.update(service_request_params)
        flash[:alert] = "Request ##{@service_request.id} updated!"
        format.html { redirect_to @service_request }
      else
        flash[:alert] = @service_request.errors.full_messages.join('. ')
        format.html { render action: "edit" }
      end
    end
  end

  def show
    @service_request = ServiceRequest.includes(:creator).find(params[:id])
  end

  def export
    start_date = params[:start_date] || Date.new(2013)
    end_date = params[:end_date] || Date.today.in_time_zone.end_of_day

    service_requests = ServiceRequest.includes(:notes, :request_type).where(created_at: start_date..end_date)

    send_data(service_requests.to_csv, :type => 'text/csv', :filename => 'service_requests.csv')
  end

  private

  def handle_missing_parms(exception)
    flash[:alert] = exception.message
    redirect_to new_service_request_path
  end

  def service_request_params
    params.require(:service_request).permit(:status,
      :community_name, :apt_number, :work_desc, :special_instructions, :alarm,
      :community_street_address, :community_zip_code, :pet,
      :authorized_to_enter, :request_type_id, :maintenance_provider,
      creator_attributes: [:name, :email, :phone]
    )
  end


end

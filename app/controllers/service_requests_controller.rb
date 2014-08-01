class ServiceRequestsController < ApplicationController
  def new
  end

  def show 
  end

  def index
    @service_resuqest = ServiceRequest.all
    
    respond_to do |format|
      format.html
      format.csv { render text: @service_request.to_csv }
    end
  end
  	
end

class RequestTypesController < ApplicationController
  respond_to :json

  def index
    @request_types = RequestType.all
  end

  def new
    @request_type = RequestType.new
  end

  def create
    @request_type = RequestType.new(request_type_params)
    authorize! :create, @request_type, :message => 'Not authorized as an administrator.'
    respond_to do |format|
      if @request_type.save
        flash[:alert] = "Request type ##{@request_type.id} was created!"
        format.html { redirect_to request_types_path }
        format.json { head 201 }
      else
        flash[:alert] = @request_type.errors.full_messages.join('. ')
        format.html { render action: "new" }
        format.json { head 400 }
      end
    end
  end

  def update
    @request_type = RequestType.find(params[:id])
    authorize! :update, @request_type, :message => 'Not authorized as an administrator.'
    respond_to do |format|

      if @request_type.update_attributes(request_type_params)
        format.html { redirect_to @request_type, alert: 'Request Type was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @request_type = RequestType.find(params[:id])
    authorize! :destroy, @request_type, :message => 'Not authorized as an administrator.'
    @request_type.destroy

    respond_to do |format|
      format.html { redirect_to request_types_url }
    end
  end

  private

  def request_type_params
    params.require(:request_type).permit(
      :category, :request
    )
  end

end

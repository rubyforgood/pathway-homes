class RequestTypesController < ApplicationController
  respond_to :json

  before_filter :authenticate_user!

  def index
    @request_types = RequestType.all
  end
end

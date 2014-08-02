class RequestTypesController < ApplicationController
  respond_to :json

  def index
    @request_types = RequestType.all
  end
end

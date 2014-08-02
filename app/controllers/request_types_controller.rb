class RequestTypesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @request_types = RequestType.all
  end

end

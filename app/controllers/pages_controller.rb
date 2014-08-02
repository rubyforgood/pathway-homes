class PagesController < ApplicationController
  skip_before_filter :authenticate_user!

  def index
  end

  def about
  end

  def contact
  end
end

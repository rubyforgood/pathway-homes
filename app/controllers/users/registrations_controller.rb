class Users::RegistrationsController < Devise::RegistrationsController
  prepend_before_filter :authenticate_scope!, :only => [:new, :create]

#  before_filter :check_permissions, :only => [:new, :create, :cancel]
#  skip_before_filter :require_no_authentication

#  def check_permissions
#    authorize! :create, resource
#  end
end



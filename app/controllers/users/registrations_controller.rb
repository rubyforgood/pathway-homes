class Users::RegistrationsController < Devise::RegistrationsController
  prepend_before_filter :authenticate_scope!, :only => [:new, :create]


#  def check_permissions
#    authorize! :create, resource
#  end
end


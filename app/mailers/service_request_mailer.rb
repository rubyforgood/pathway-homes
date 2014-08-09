class ServiceRequestMailer < ActionMailer::Base
  # Delivers an email to a service request creator
  def creator_confirmation(service_request)
    return unless service_request.creator && service_request.creator.email.present?

    @service_request = service_request
    @creator = service_request.creator
    mail to: @creator.email,
         subject: "Service Request ##{service_request.id} Submitted"
  end

  def creator_update_on_completion(service_request)
    return unless service_request.creator && service_request.creator.email.present?

    @service_request = service_request
    @creator = service_request.creator
    mail to: @creator.email,
         subject: "Service Request ##{service_request.id} is Closed"
  end
end

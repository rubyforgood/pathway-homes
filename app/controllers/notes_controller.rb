class NotesController < ApplicationController
  def index
    @service_request = ServiceRequest.find(note_params[:service_request_id])
    @notes = @service_request.notes
  end

  def create
    #@note = Note.new(service_request_id: params[:service_request_id], user: current_user, note: note_params[:note])
    @service_request = ServiceRequest.find(params[:service_request_id])
    @note = Note.new(note_params)
    @note.service_request_id = params[:service_request_id]
    @note.user = current_user

    respond_to do |format|
      if @note.save
        flash[:notice] = "Note was added to request ##{@service_request.id}!"
        format.html { redirect_to @service_request }
      else
        flash[:alert] = @note.errors.full_messages.join('. ')
        format.html { redirect_to @service_request }
      end
    end
  end

  private
  def note_params
    params.require(:note).permit(:note) #, :service_request_id)
  end
end

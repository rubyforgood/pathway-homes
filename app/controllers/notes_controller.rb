class NotesController < ApplicationController
  def index
    @service_request = ServiceRequest.find(params[:service_request_id])
    @notes = @service_request.notes
  end

  def create
    @service_request = ServiceRequest.find(params[:service_request_id])
    @note = @service_request.notes.build(note_params)
    @note.user = current_user

    respond_to do |format|
      if @note.save
        format.json { render action: "show", status: :created }
      else
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def note_params
    params.require(:note).permit(:note)
  end
end

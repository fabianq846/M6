class ApplicationsController < ApplicationController
# app/controllers/applications_controller.rb

def new
    @application = Application.new
  end
  
  def create
    @application = current_user.applications.build(application_params)
    if @application.save
      NotificationMailer.new_application(@application).deliver_now
      redirect_to applications_path, notice: 'Postulación enviada'
    else
      render :new
    end
  end
  
  private
  
  def application_params
    params.require(:application).permit(:message, :job_offer_id)
end


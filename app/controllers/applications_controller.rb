class ApplicationsController < ApplicationController
# app/controllers/applications_controller.rb

def new
    @application = Application.new
  end
  
  def create
    @application = current_user.applications.new(application_params)
  
    if @application.save
      NotificationMailer.new_application(@application).deliver_now
      redirect_to user_applications_path(current_user), notice: 'Successfully applied!'
    else
      redirect_to job_postings_path, alert: 'Application failed!'
    end
  end
  
  
  def index
    @applications = current_user.applications
  end
  
  
  private
  
  def application_params
    params.require(:application).permit(:message, :job_offer_id)
  end
end

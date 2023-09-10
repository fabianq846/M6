class NotificationMailer < ApplicationMailer
  def new_application(application)
    @application = application
    mail(to: 'esteban@GMAIL.com', subject: 'Nueva Postulación')
  end
end

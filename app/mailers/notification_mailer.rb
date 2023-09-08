class NotificationMailer < ApplicationMailer
    default to: 'esteban@gmail.com' # Cambia esto al correo real de Esteban
  
    def new_application(application)
      @application = application
      mail(subject: 'New job application received')
    end
  end
  
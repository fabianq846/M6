class NotificationMailer < ApplicationMailer
    def new_application(application)
        @application = application
        mail(to: "esteban_email@example.com", subject: 'Nueva Postulación')
    end
end

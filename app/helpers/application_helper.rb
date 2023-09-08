module ApplicationHelper
    def current_user_photo
        if current_user && current_user.photo.attached?
          image_tag current_user.photo, size: "50x50", alt: "User Photo"
        else
          "No photo available"
        end
      end
      
end

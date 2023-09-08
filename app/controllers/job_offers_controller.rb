class JobOffersController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :ensure_admin, only: [:new, :create, :edit, :update, :destroy]

    ...

    private

    def ensure_admin
        redirect_to root_path, alert: 'Acceso no permitido' unless current_user.admin?
    end

end

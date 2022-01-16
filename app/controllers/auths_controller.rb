class AuthsController < ApplicationController
    def auth
        render :layout => nil
    end

    def login
        admin = Auth.find_by(name: "admin")
        if admin.authenticate(params[:session][:password])
            log_in admin
            redirect_back_or "/"
        else
            redirect_to auth_path
        end
    end

end
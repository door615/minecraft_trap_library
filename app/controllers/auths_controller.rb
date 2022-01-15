class AuthsController < ApplicationController
    def auth
        render :layout => nil
    end

    def login
        admin = Auth.find_by(name: "admin")
        if admin.authenticate(params[:password])
            render 'posts/new'
        end
    end

end
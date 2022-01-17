class AuthsController < ApplicationController

    #管理人の認証ページです。
    def auth
        render :layout => nil
    end

    #ログインをするメソッドです
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
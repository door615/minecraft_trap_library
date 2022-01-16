module SessionsHelper

    # 渡されたユーザーでログインする
    def log_in(admin)
      session[:admin_id] = admin.id
    end

    def current_user
        if session[:admin_id]
          @current_user ||= Auth.find_by(id: session[:admin_id])
        end
    end

    def logged_in?
        !current_user.nil?
    end

    def redirect_back_or(default)
        redirect_to(session[:forwarding_url] || default)
        session.delete(:forwarding_url)
    end

    def store_location
        if request.get?
            session[:forwarding_url] = request.original_url
        end
    end
end
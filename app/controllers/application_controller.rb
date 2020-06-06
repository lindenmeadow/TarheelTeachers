class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :current_user, :signed_in?

    before_action :initialize_user

    def initialize_user
      @user = User.new
    end

    def sign_in_required
        if !signed_in?
          redirect_to root_path, flash: {notice: "You must sign in first."}
        end
      end

    def signed_in?
        !!current_user
    end

    def current_user 
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
      end
end

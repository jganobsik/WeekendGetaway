class SessionsController < ApplicationController
    def new
        @user = User.new
        render :login
    end

    def create
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id 
            redirect_to dashboard_path
        else
            redirect_to '/login'
        end
    end


    def destroy
        session.clear 
        redirect_to '/'
    end

    def fb_create
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
            u.username = auth['info']['name']
            u.password = auth['uid'] 
          end
     
        session[:user_id] = @user.id
     
        redirect_to dashboard_path
      end
     
      private
     
      def auth
        request.env['omniauth.auth']
      end
end

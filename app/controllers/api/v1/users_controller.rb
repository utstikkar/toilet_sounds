module Api
  module V1
    class UsersController < ApplicationController
      respond_to :json
            
      def login
        @user = User.find_or_create_by(email: params[:email], password: params[:password])
      end      
      
    end
  end
end
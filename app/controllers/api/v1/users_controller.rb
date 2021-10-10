module Api
  module V1
    class UsersController < ApplicationController

      def index
        @users = User.order('created_at DESC')

        render json: @users
      end

      def create
        @user = User.new(user_params)

        if @user.save
          render json: @user
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      private

      def user_params
        puts params
        params.require(:user).permit(:email, :name)
      end
    end
  end
end
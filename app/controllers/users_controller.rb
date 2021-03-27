module Api
  module V1
    class UsersController < ApplicationController
      def index
        @users = User.all
        render json: { status: 'SUCCESS', message: 'Loaded Users', data: @users }, status: :ok
      end

      def show
        @user = User.find(params[:id])
        render json: { status: 'SUCCESS', message: 'Loaded User', data: @user }, status: :ok
      end

      def create
        @user = User.new(user_params)

        if @user.save
          render json: { status: 'SUCCESS', message: 'Saved User', data: @user }, status: :ok
        else
          render json: { status: 'ERROR', message: 'User was not saved',
                         data: @user.errors }, status: :unprocessable_entity
        end
      end

      def update
        @user = User.find(params[:id])

        if @user.update_attributes(user_params)
          render json: { status: 'SUCCESS', message: 'Updated user data', data: @course }, status: :ok
        else
          render json: { status: 'ERROR', message: 'User was not updated',
                         data: @user.errors }, status: :unprocessable_entity
        end
      end

      def destroy
        @user = User.find(params[:id])
        @user.destroy
        render json: { status: 'SUCCESS', message: 'course deleted', data: @course }, status: :ok
      end

      private

      def user_params
        params.permit(:name)
      end
    end
  end
end

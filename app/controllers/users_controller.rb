module Api
  module V1
    class UsersController < ApplicationController
      #   def index
      #     @users = User.all
      #     render json: { status: 'SUCCESS', message: 'Loaded Users', data: @users }, status: :ok
      #   end

      #   def show
      #     @user = User.find(params[:id])
      #     render json: { status: 'SUCCESS', message: 'Loaded User', data: @user }, status: :ok
      #   end

      #   def create
      #     @user = User.new(user_params)

      #     if @user.save
      #       render json: { status: 'SUCCESS', message: 'Saved User', data: @user }, status: :ok
      #     else
      #       render json: { status: 'ERROR', message: 'User was not saved',
      #                      data: @user.errors }, status: :unprocessable_entity
      #     end
      #   end

      #   def update
      #     @user = User.find(params[:id])

      #     if @user.update_attributes(user_params)
      #       render json: { status: 'SUCCESS', message: 'Updated user data', data: @course }, status: :ok
      #     else
      #       render json: { status: 'ERROR', message: 'User was not updated',
      #                      data: @user.errors }, status: :unprocessable_entity
      #     end
      #   end

      #   def destroy
      #     @user = User.find(params[:id])
      #     @user.destroy
      #     render json: { status: 'SUCCESS', message: 'course deleted', data: @course }, status: :ok
      #   end

      #   private

      #   def user_params
      #     params.permit(:name)
      #   end
      before_action :authorized, only: [:auto_login]
      # REGISTER
      def create
        @user = User.create(user_params)
        if @user.valid?
          token = encode_token({ user_id: @user.id })
          render json: { user: @user, token: token }
        else
          render json: { error: 'Invalid name or password' }
        end
      end

      # LOGGING IN
      def login
        @user = User.find_by(name: params[:name])

        if @user&.authenticate(params[:password])
          token = encode_token({ user_id: @user.id })
          render json: { user: @user, token: token }
        else
          render json: { error: 'Invalid name or password' }
        end
      end

      def auto_login
        render json: @user
      end

      private

      def user_params
        params.permit(:name, :password)
      end
    end
  end
end

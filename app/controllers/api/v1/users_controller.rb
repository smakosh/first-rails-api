module Api
  module V1
    class UsersController < ApplicationController
      def index
        users = User.order('created_at DESC');

        render json: {status: 'success', message: 'Loaded users', data:users},status: :ok
      end

      def show
        user = User.find(params[:id])

        render json: {status: 'success', message: 'Loaded user', data:user},status: :ok
      end

      def create
        user = User.new(user_params)

        if user.save
          render json: {status: 'success', message: 'Saved user', data:user},status: :ok
        else
          render json: {status: 'error', message: 'User not saved', data:user.errors},status: :unprocessable_entity
        end
      end

      def destroy
        user = User.find(params[:id])
        user.destroy

        render json: {status: 'success', message: 'Deleted user', data:user},status: :ok
      end

      def update
        user = User.find(params[:id])
        if user.update_attributes(user_params)
          render json: {status: 'success', message: 'Updated user', data:user},status: :ok
        else
          render json: {status: 'error', message: 'User not updated', data:user.errors},status: :unprocessable_entity
        end
      end

      private

      def user_params
        params.permit(:email, :username, :password)
      end
    end
  end
end
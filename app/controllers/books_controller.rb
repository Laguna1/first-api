module Api
  module V1
    class BooksController < ApplicationController
      before_action :authorized

      def index
        @books = Book.all.order("created_at DESC").where(user_id: @user.id)
        render json: { books: @books }, status: :ok
      end

      def show
        @book = Book.find(params[:id])
        render json: { book: @book }, status: :ok
      end

      def create
        @book = Book.new(book_params)
        @course.user_id = @user.id
        
        if @book.save
          render json: { book: @book }, status: :ok
        else
          render json: { error: @book.errors }, status: :unprocessable_entity
        end
      end

      def update
        @book = Book.find(params[:id])

        if @book.update_attributes(book_params)
          render json: { book: @book }, status: :ok
        else
          render json: { error: @book.errors }, status: :unprocessable_entity
        end
      end

      def destroy
        @book = Book.find(params[:id])
        @book.destroy
        render json: { book: @book }, status: :ok
      end

      private

      def book_params
        params.permit(:title, :pages,
                      :read, :author)
      end
    end
  end
end

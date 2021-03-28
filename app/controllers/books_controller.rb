module Api
  module V1
    class BooksController < ApplicationController
      before_action :authorized

      def index
        @books = logged_in_user.books
        render json: { books: @books }, status: :ok
      end

      def show
        @book = logged_in_user.books.find(params[:id])
        render json: { book: @book }, status: :ok
      end

      def create
        @book = logged_in_user.books.build(book_params)
        
        if @book.save
          render json: { book: @book }, status: :ok
        else
          render json: { error: @book.errors }, status: :unprocessable_entity
        end
      end

      def update
        @book = logged_in_user.books.find(params[:id])

        if @book.update_attributes(book_params)
          render json: { book: @book }, status: :ok
        else
          render json: { error: @book.errors }, status: :unprocessable_entity
        end
      end

      def destroy
        @book = logged_in_user.books.find(params[:id])
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

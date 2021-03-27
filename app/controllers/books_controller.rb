module Api
  module V1
    class BooksController < ApplicationController
      def index
        @books = Book.all
        render json: { status: 'SUCCESS', message: 'Loaded Books', data: @books }, status: :ok
      end

      def show
        @book = Book.find(params[:id])
        render json: { status: 'SUCCESS', message: 'Loaded Books', data: @book }, status: :ok
      end

      def create
        @book = Book.new(book_params)

        if @book.save
          render json: { status: 'SUCCESS', message: 'Saved Books', data: @book }, status: :ok
        else
          render json: { status: 'ERROR', message: 'Book was not saved',
                         data: @book.errors }, status: :unprocessable_entity
        end
      end

      def update
        @book = Book.find(params[:id])

        if @book.update_attributes(book_params)
          render json: { status: 'SUCCESS', message: 'Updated Book', data: @book }, status: :ok
        else
          render json: { status: 'ERROR', message: 'Book was not updated',
                         data: @book.errors }, status: :unprocessable_entity
        end
      end

      def destroy
        @book = Book.find(params[:id])
        @book.destroy
        render json: { status: 'SUCCESS', message: 'Book deleted', data: @book }, status: :ok
      end

      private

      def book_params
        params.permit(:title, :pages,
                      :read, :author)
      end
    end
  end
end

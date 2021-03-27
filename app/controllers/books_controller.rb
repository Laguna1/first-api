module Api
  module V1
    class BooksController < ApplicationController
      def index
        @books = Book.all
        render json: { status: 'SUCCESS', message: 'Loaded Books', data: @books }, status: :ok
      end
    end
  end
end

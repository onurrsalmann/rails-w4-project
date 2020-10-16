class WelcomeController < ApplicationController
  def index
    if current_user
      @my_books = current_user.books
    end
    @books = Book.all.where(share: true)
  end
end

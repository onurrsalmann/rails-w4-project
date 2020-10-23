class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
    @books = current_user.books
    @comments = Comment.where(book_id: @books.each {|book| book.id}, allow: false)

  end
end

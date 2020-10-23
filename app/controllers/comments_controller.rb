class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  def create
    @book = Book.find(params[:book_id])
    @comment = @book.comments.create(comment_params)
    @comment.user_id = current_user.id
    @comment.allow = false
    @comment.save
    redirect_to user_path(User.find(@book.user_id))
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def edit
    @comment = Comment.find(params[:id])
    @comment.allow = true
    @comment.save
    redirect_to book_path(Book.find(@comment.book_id))
  end

  private

  def comment_params
    params.require(:comment).permit(:title, :content)
  end
end

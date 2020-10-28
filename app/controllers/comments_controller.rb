class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @book = Book.find(params[:book_id])
    @comment = @book.comments.create(comment_params)
    @comment.user_id = current_user.id
    # if @book.user_id.eql?(current_user.id)
    #   @comment.allow = true
    # end
    @comment.save
    respond_to do |format|
      format.js
    end
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

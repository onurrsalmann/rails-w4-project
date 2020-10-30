class TradeablesController < ApplicationController
  def show
    @book = Book.find(params[:book_id])
    @tradeable = Tradeable.find(params[:id])
  end

  def accept
    @tradeable = Tradeable.find(params[:id])
    @tradeable.status = "accept"
    @tradeable.save
    redirect_to root_path
  end

  def deny
    @tradeable = Tradeable.find(params[:id])
    @tradeable.status = "deny"
    @tradeable.save
    redirect_to root_path
  end

  def new
    @tradeable = Tradeable.new
    @book = Book.find(params[:book_id])
  end

  def create
    @tradeable = Tradeable.new(book_params)
    @tradeable.user_id = current_user.id
    @tradeable.save
    redirect_to '/dashboard'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_tradeable
    @tradeable = Tradeable.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def book_params
    params.require(:tradeable).permit(:book_id)
  end
end

class BoardsController < ApplicationController
  before_action :set_board, only: [:edit, :show, :update, :destroy]

  def index
    @boards = Board.all
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
    if @board.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @board.update(board_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @board.destroy
    redirect_to root_path
  end


  private
    def board_params
      params.require(:board).permit(:title)
    end

    def set_board
      @board = Board.find(params[:id])
    end
end

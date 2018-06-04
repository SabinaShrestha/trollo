class ListsController < ApplicationController
  before_action :set_board
  before_action :set_list, only: [:edit, :new, :show, :destroy]

  def index
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to board_path(@board)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @list.update(list_params)
      redirect_to board_path(@board)
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @list.destroy
    redirect_to
  end

  private
    def list_params
      params.require(:list).permit(:title, :priority)
    end

    def set_list
      @list = List.find(params[:id])
    end

    def set_board
      @board = Board.find(params[:board_id])
    end


end

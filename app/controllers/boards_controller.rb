class BoardsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @boards = Board.all
  end

  def new
    @board = current_user.boards.build
  end

  def create
    @board = current_user.boards.build(board_params)
    if @board.save
      redirect_to board_path(@board), notice: '保存できました！'
    else
      flash.now[:error] = '保存に失敗しました'
      render :new
    end

  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def board_params
    params.require(:board).permit(:name, :description)
  end

end
class TasksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_board, only: [:new, :create]


  def new
    @task = current_user.tasks.build
  end

  def create
    @task = current_user.tasks.build(task_params)
    @task.board_id = @board.id
    if @task.save
      redirect_to board_path(@board), notice: "保存できました！"
    else
      flash.now[:error] = "保存に失敗しました"
      render :new
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = current_user.tasks.find(params[:id])
  end

  def update
    @task = current_user.tasks.find(params[:id])
    if @task.update(task_params)
      redirect_to board_task_path(@task.board.id, @task.id), notice: "更新できました！"
    else
      flash.now[:error] = "更新できませんでした"
      render :edit
    end
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy!
    redirect_to board_path(task.board), notice: "削除しました！"
  end

  private
  def task_params
    params.require(:task).permit(:title, :content, :deadline, :eyecatch)
  end

  def set_board
    @board = Board.find(params[:board_id])
  end

end
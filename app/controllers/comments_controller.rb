class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_comment, only: [:new, :create]

  def new
    @comment = current_user.comments.build
  end

  def create
    @comment = current_user.comments.build(comment_params)
    @comment.task_id = @task.id
    if @comment.save
      redirect_to board_task_path(@board, @task), notice: "保存できました！"
    else
      flash.now[:error] = "保存に失敗しました"
      render :new
    end

  end

  def edit
    # @task = current_user.tasks.find(params[:id])
  end

  def update
    # @task = current_user.tasks.find(params[:id])
    # if @task.update(task_params)
    #   redirect_to board_task_path(@task.board.id, @task.id), notice: "更新できました！"
    # else
    #   flash.now[:error] = "更新できませんでした"
    #   render :edit
    # end
  end

  def destroy
    # task = Task.find(params[:id])
    # task.destroy!
    # redirect_to board_path(task.board), notice: "削除しました！"
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_comment
    @board = Board.find(params[:board_id])
    @task = Task.find(params[:task_id])
  end

end
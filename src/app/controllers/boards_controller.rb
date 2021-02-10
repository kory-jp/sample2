class BoardsController < ApplicationController
  # before_action :set_target_board, only: %i[show edit update destroy]
  skip_before_action :authenticate_user, {only: [:index, :show]}
  protect_from_forgery :except => [:destroy]


  def index  
      @boards = params[:tag_id].present? ? Tag.find(params[:tag_id]).boards : Board.all
      @boards = @boards.page(params[:page])
  end

  def new
    # flashはcreateアクションでセーブエラーした場合に、new画面上に値をセットするため(63)
    @board = Board.new(flash[:board])
  end

  def create
    board = Board.new(board_params)
    # user_idを追加
    # board.user = current_user
    # board.user_id = current_user.id
    if board.save
      flash[:notice] = "「#{board.title}」の掲示板を作成しました"
      redirect_to board
    else
      redirect_to new_board_path, flash: {
        board: board,
        error_messages: board.errors.full_messages
      }
    end
  end

  def show
    set_target_board
    # @comment = @board.comments.new
    @comment = Comment.new(board_id: @board.id)
  end

  def edit
    set_target_board
  end

  def update
    set_target_board
    # view作成しないためローカル変数で可
    # @board.update(board_params)

    # redirect_to @board
    # @board.user_id = current_user.id
    if @board.update(board_params)
      redirect_to @board
    else
      redirect_to edit_board_path, flash: {
        board: @board,
        error_messages: @board.errors.full_messages
      }
    end
  end

  def destroy
    set_target_board
    @board.destroy
    redirect_to boards_path, flash: {notice: "「#{@board.title}」の掲示板が削除されました"}
  end

  private
  
  def board_params
    params.require(:board).permit(:name, :title, :body, tag_ids:[]).\
    merge(user_id: current_user.id).merge(:image_data)
  end

  def set_target_board
    @board = Board.find(params[:id])
  end

end

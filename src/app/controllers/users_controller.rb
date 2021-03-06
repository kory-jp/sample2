class UsersController < ApplicationController
  skip_before_action :authenticate_user, {only: [:new, :create]}

  def new
    @user = User.new(flash[:user])
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to mypage_path
    else
      # redirect_to :back, flash: {
      #   user: user,
      #   error_messages: user.errors.full_messages
      # }

      redirect_back fallback_location: root_path, flash: {
        user: user,
        error_messages: user.errors.full_messages
      }
    end
  end

  def me
    @user = current_user
    @favorite_boards = @user.favorite_boards
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to mypage_path
    else
      redirect_to edit_user_path, flash: {
        user: @user,
        error_messages: @user.errors.full_messages
      }
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end

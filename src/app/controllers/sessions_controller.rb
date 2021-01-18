class SessionsController < ApplicationController
  def create
    user = User.find_by(name: params[:session][:name])
    session[:user_id] = user.id
    redirect_to mypage_path
  else
    render 'home/index'
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end

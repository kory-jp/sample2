class ApplicationController < ActionController::Base
  before_action :current_user

  private
  
  def current_user
    # return unless session[:user_id]
    @current_user = User.find_by(id: session[:user_id])
  end

  def authenticate_user
    if @current_user == nil
      flash[:notice] = "ログインが必要です"
      redirect_to root_path
    end
  end
end

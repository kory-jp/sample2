class ApplicationController < ActionController::Base
  include CommonMethod
  before_action :current_user
  before_action :authenticate_user

end

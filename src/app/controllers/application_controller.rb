class ApplicationController < ActionController::Base
  include Sessionable
  before_action :current_user
  before_action :authenticate_user

end

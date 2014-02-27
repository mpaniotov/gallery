class ActionsController < ApplicationController
  before_filter :authenticate_user!
  include ActionsHelper

  def index
    @users_all = User.all
  end

  def show
    @user_id = params[:user_id].to_i
    @user_nav = Action.where(:user_id=>@user_id,:action_type=>params[:action_type])
    action_info(@user_nav)
  end

end

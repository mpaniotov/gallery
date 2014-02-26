class ActionsController < ApplicationController
  before_filter :authenticate_user!
  def index
    @category_all=Category.all
    @users_all=User.all
  end

  def show
    @category_all=Category.all
    @user_id = params[:user_id].to_i
    case params[:action_type]
        when 'navigation'
          action_info
        when 'user_sign_in'
          action_info
        when 'user_sign_out'
          action_info
        when 'likes'
          action_info
        when 'comments'
          action_info
    end

  end

  private
  def action_info
    @all=[]
    @action=[]
    @object_id=[]
    @url=[]
    @time=[]
    @user_nav=Action.where(:user_id=>@user_id,:action_type=>params[:action_type])
    @user_nav.each do |current_action|
      @action<<current_action.data[:description]
      @object_id<<current_action.data[:id]
      @url<<current_action.data[:url]
      @time<<current_action.data[:time]
    end
  end


end

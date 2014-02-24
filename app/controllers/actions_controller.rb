class ActionsController < ApplicationController
  before_filter :authenticate_user!
  def index
    @category_all=Category.all
    @users_all=User.all
  end

  def show
    @category_all=Category.all
    user_id = params[:user_id].to_i
    case params[:action_type]
        when 'navigation'
            @user_nav=Action.where(:user_id=>user_id,:action_type=>params[:action_type])
        when 'user_sign_in'
            @user_nav=Action.where(:user_id=>user_id,:action_type=>params[:action_type])
        when 'user_sign_out'
          @user_nav=Action.where(:user_id=>user_id,:action_type=>params[:action_type])
        when 'user_likes'
          @user_nav=Action.where(:user_id=>user_id,:action_type=>params[:action_type])
        when 'user_comments'
          @user_nav=Action.where(:user_id=>user_id,:action_type=>params[:action_type])
    end

  end


end

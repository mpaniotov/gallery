class PicturesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @pictures = Picture.order(likes_count: :desc)
    Action.create(:user_id=>current_user.id, :action_type=>"navigation", :data => {:url=>request.original_url,:description=>'Watch all categories',:time=>Time.now})
  end

  def show
    @picture = Picture.find(params[:picture_id])
    @category = Category.where(:picture_id=>@picture.id)
    @like_for_chosen_picture = Like.where(:user_id =>current_user.id, :picture_id => @picture.id).first
    @comments=Comment.preload(:picture, :user).where(:picture_id=>@picture.id)
    if !params[:redirect]
      Action.create(:user_id=>current_user.id, :action_type=>"navigation", :data => {:url=>request.original_url,:id=>@picture.id,:description=>'Watch picture',:time=>Time.now})
    end
  end


end

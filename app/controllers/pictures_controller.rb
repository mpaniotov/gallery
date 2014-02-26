class PicturesController < ApplicationController
  before_filter :authenticate_user!
  def index
    @category_all=Category.all
    @pictures = Picture.all.order(likes_count: :desc)
    Action.create(:user_id=>current_user.id, :action_type=>"navigation", :data => {:url=>request.original_url,:description=>'Watch all categories',:time=>Time.zone.now})
  end

  def show
    @div_id=params[:div_id].to_i
    @picture=Picture.find(params[:picture_id])
    @category_all=Category.all
    @category=Category.where(:picture_id=>@picture.id)
    @like_for_chosen_picture = Like.where(:user_id =>current_user.id, :picture_id => @picture.id).first
    if !params[:redirect]
    Action.create(:user_id=>current_user.id, :action_type=>"navigation", :data => {:url=>request.original_url,:id=>@picture.id,:description=>'Watch picture',:time=>Time.zone.now})
      end
  end


end

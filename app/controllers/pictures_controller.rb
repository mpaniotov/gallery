class PicturesController < ApplicationController
  before_filter :authenticate_user!
  def index
    @category_all=Category.all
    @pictures = Picture.all.order(likes_count: :desc)

    Action.create(:user_id=>current_user.id,:navigation=>"Watch all categories",:action_type=>"navigation")
  end

  def show
    @picture=Picture.find(params[:picture_id])
    @category_all=Category.all
    @category=Category.where(:picture_id=>@picture.id)
    @like_for_chosen_picture = Like.where(:user_id =>current_user.id, :picture_id => @picture.id).first
    if !params[:redirect]
    Action.create(:user_id=>current_user.id,:navigation=>"Watch picture: #{@picture.path}", :action_type=>"navigation")
      end
  end


end

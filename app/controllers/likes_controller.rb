class LikesController < ApplicationController
  before_filter :authenticate_user!
  def new
    @picture = Picture.find(params[:id])
    @category =Category.find(@picture.category_id)
      if params[:like_deleted] == "true" then
        Picture.decrement_counter(:likes_count, @picture.id)
        @like = Like.delete_all(:user_id => current_user.id,:picture_id => @picture.id)
      else
        @like = Like.create(:user_id => current_user.id,:picture_id => @picture.id)
        Picture.increment_counter(:likes_count, @picture.id)
        Action.create(:user_id=>current_user.id, :action_type=>"likes", :data => {:url=>request.referrer,:id=>@picture.id,:description=>'Left like for picture',:time=>Time.zone.now})
      end
    redirect_to pict_path(:picture_id=>@picture.id,:name=>@category.name,:redirect=>true)
  end

end

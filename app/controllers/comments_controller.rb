class CommentsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @picture = Picture.where(:id => params[:picture_id]).first!
    @category =Category.find(@picture.category_id)
    @comment = @picture.comments.build(comment_params.merge(:user => current_user, :picture => @picture))
    if simple_captcha_valid?
      @comment.save
      Action.create(:user_id=>current_user.id, :action_type=>"comments", :data => {:url=>request.original_url,:comment_id=>@comment.id,:picture_id=>@picture.id,:category_name=>@category.name,:description=>'Left comment'})
    end
    redirect_to pict_path(:picture_id=>@picture.id,:redirect=>true)
  end

  private
  def comment_params
    params.require(:comment).permit(:text)
  end
end

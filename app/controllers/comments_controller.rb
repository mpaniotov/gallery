class CommentsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @picture = Picture.where(:id => params[:picture_id]).first!
    @comment = @picture.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comment.picture_id = @picture.id
    @comment.save
    Action.create(:user_id=>current_user.id,:navigation=>"Left comment for picture: #{@picture.path}",:action_type=>"user_comments")
    redirect_to pict_path(:picture_id=>@picture.id,:redirect=>true)
  end

  private
  def comment_params
    params.require(:comment).permit(:text)
  end
end

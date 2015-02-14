class CommentsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @picture = Picture.where(:id => params[:picture_id]).first!
    @category = Category.find(@picture.category_id)
    @comment = @picture.comments.build(comment_params.merge(:user => current_user, :picture => @picture))
    if simple_captcha_valid?
      @comment.save
      Action.create(:user_id=>current_user.id, :action_type=>"comments", :data => {:url=>request.original_url+'#'+@comment.id.to_s,:id=>@comment.id,:description=>'Left comment',:time=>Time.now})
    end
    redirect_to pict_path(:picture_id=>@picture.id,:redirect=>true)
  end

  def update
    @comment_update=Comment.find(params[:id])
    if @comment_update.update(comment_params)
      render text: 'Success'
    else
      render text: 'Something happens'
    end

  end
  
  def edit
    @comment = Comment.find(params[:id])
  end

  private
  def comment_params
    params.require(:comment).permit(:text)
  end
end

class CategoriesController < ApplicationController
  before_filter :authenticate_user!

  def show
    @picture = Picture.all
    @category = Category.where(:name => params[:id]).first!
    @category_pictures = @category.pictures.order(likes_count: :desc).page(params[:page]).per(5)
    Action.create(:user_id=>current_user.id, :action_type=>"navigation", :data => {:url=>request.original_url,:id=>@category.name,:description=>'Watch category',:time=>Time.now})
  end

  private
  def post_params
    params.require(:category).permit(:title, :text)
  end

end

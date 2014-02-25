class CategoriesController < ApplicationController
  before_filter :authenticate_user!


  def index
    @category_all=Category.all

  end

  def show
    @picture=Picture.all
    @category_all=Category.all
    @category =Category.where(:name => params[:id]).first!
    @category_pictures = @category.pictures.order(likes_count: :desc).page(params[:page]).per(5)
    Action.create(:user_id=>current_user.id, :action_type=>"navigation", :data => {:url=>request.original_url,:category_name=>@category.name,:description=>'Watch category'})
  end

  private
  def post_params
    params.require(:category).permit(:title, :text)
  end



end

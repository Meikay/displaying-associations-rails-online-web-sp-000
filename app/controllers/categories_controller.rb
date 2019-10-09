class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    category = Category.create(params[:category])
    redirect_to category_path(category)
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
	 @category = Category.find(params[:id])
	 if @category.update(category_params)
		 redirect_to @category
	 else
		 render :edit
	 end
 end

 private

  def category_params
    params.require(:category).permit(
      :title, :description, :post_status, :author_id, :category_id
    )
  end
end

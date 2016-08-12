class Admin::CategoriesController < ApplicationController

  def index
    @category = Category.new
    @categories = Category.order(id: :desc).all
    puts "Touched controller!!!!!!!!!!!!!!!!!!!!!"
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end

  def destroy
    @category = Category.find params[:id]
    @category.destroy
    redirect_to [:admin, :categories], notice: 'Category deleted!'
  end

private
  def category_params
    params.require(:category).permit(
      :name
    )
  end
end
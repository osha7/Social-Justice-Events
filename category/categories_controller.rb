class CategoriesController < ApplicationController
    before_action :set_category, only: [:show, :edit, :update]

    def index
      @categories = Category.all
    end
  
    def show
    end
  
    def new
      @category = Category.new
    end
  
    def create
      category = Category.create(category_params)
      redirect_to category_path(category)
    end
  
    def edit
    end
  
    def update
      category.update(category_params)
      redirect_to category_path(category)
    end
  
    private
  
    def category_params
      params.require(:category).permit(:name)
    end

    def set_category
        @category = Category.find(params[:id])
    end

  end
  

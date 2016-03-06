class RecipesController < ApplicationController

	def index
		@user = current_user
		@recipe = Recipe.all
	end

	def show
		@recipe = Recipe.find(params[:id])
	end

	def new
		@recipe = Recipe.new
	end

	def create
		@user = current_user

		@recipe = Recipe.new(recipe_params)
		if @recipe.save
			redirect_to recipes_path
		else
			flash[:alert] = "Make sure you have a title and recipe!"
		end
	end

	def edit
		@recipe.find(params[:id])
	end

	def update
		@user = current_user
		@recipe.find(params[:id])
		if @recipe.update_attributes(recipe_params)
			redirect_to recipes_path
		else
			render :edit
		end
	end

	def destroy
		@recipe = Recipe.find(params[:id])
		@recipe.delete
		redirect_to recipes_path
	end

	private
	def recipe_params
		params.require(:recipe).permit(:title, :body)
	end
end

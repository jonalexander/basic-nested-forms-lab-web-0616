
class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])

  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    10.times { @recipe.ingredients.build }
  end

  def create
    #byebug
    @recipe = Recipe.new(recipe_params)
    byebug
    @recipe.save
    #byebug
    redirect_to recipe_path(@recipe)
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :ingredients_attributes => [:name, :quantity])
  end
end


  # create_table "ingredients", force: :cascade do |t|
  #   t.string   "name"
  #   t.string   "quantity"
  #   t.datetime "created_at", null: false
  #   t.datetime "updated_at", null: false
  #   t.integer  "recipe_id"
  # end

  # create_table "recipes", force: :cascade do |t|
  #   t.string   "title"
  #   t.datetime "created_at", null: false
  #   t.datetime "updated_at", null: false
  # end




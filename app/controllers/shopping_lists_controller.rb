class ShoppingListsController < ApplicationController
  def index
    @recipe = Recipe.find(params[:recipe_id])
    @shopping_lists = @recipe.recipe_foods.includes([:food])
    @total = sum(@shopping_lists)
  end

  private

  def sum(shopping_lists)
    total = 0
    total_items = 0
    shopping_lists.each do |item|
      total += item.food.price * item.quantity.to_i
      total_items+=1
    end
    total
  end
end

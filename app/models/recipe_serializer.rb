class RecipeSerializer < ActiveModel::Serializer
  # serialize :recipe_object, JSON

  belongs_to :user
  attributes :id, :recipe_object
end

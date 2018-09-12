class RecipeSerializer < ActiveModel::Serializer
  serialize :recipe_object, JSON

  has_many :users
  attributes :id, :recipe_object
end

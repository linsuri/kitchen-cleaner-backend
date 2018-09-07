class RecipeSerializer < ActiveModel::Serializer
  has_many :users
  attributes :id, :title, :category
end

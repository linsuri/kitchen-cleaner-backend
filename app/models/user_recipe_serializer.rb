class UserRecipeSerializer < ActiveModel::Serializer
  belongs_to :user
  belongs_to :recipe
  attributes :id, :marked_as_cooked
end

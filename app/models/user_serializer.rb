class UserSerializer < ActiveModel::Serializer
  has_many :recipes
  attributes :id, :user_name
end

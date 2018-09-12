class Recipe < ApplicationRecord
  serialize :recipe_object, JSON
  validates :recipe_object, uniqueness: true

  belongs_to :user
end


# class Foo < ActiveRecord::Base
#   serialize :field, JSON
# end
#
# bar = Foo.new
# bar.field = [1,2,3]
# bar.save

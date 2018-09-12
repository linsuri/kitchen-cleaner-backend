class Recipe < ApplicationRecord
  serialize :recipe_object, JSON


  has_many :users
end


# class Foo < ActiveRecord::Base
#   serialize :field, JSON
# end
#
# bar = Foo.new
# bar.field = [1,2,3]
# bar.save

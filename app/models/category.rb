class Category < ActiveRecord::Base
    has_many :pizzas
end

class Fridge < ApplicationRecord
    has_many :food, dependent: :destroy
    has_many :drink, dependent: :destroy
end

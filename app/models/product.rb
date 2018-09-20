class Product < ApplicationRecord
  has_many :pictures, as: :ownerable
end

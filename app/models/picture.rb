class Picture < ApplicationRecord
  belongs_to :ownerable, polymorphic: true
end

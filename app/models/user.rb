class User < ApplicationRecord
  has_one :avatar, as: :ownerable
end

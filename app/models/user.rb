class User < ApplicationRecord
  has_one :accounts
  has_one :exchange, through: :account
end

class Account < ApplicationRecord
  has_many :orders
  has_many :addresses
  belongs_to :user

end

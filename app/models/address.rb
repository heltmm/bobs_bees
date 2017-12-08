class Address < ApplicationRecord
  has_many :orders
  belongs_to :account, optional: true
end

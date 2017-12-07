class Address < ApplicationRecord
  belongs_to :order
  belongs_to :account, optional: true
end

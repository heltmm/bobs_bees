class Product < ApplicationRecord
  has_many :order_items
  has_many :reviews

  validates :name, presence: true
  validates :price, presence: true, numericality: { only_decimal: true, greater_than: 0 }

  has_attached_file :photo, :styles => { :large => "600x600", :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
end

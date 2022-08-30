class Product < ApplicationRecord
  monetize :price_cents, numericality: true
  mount_uploader :image, ProductImageUploader

  belongs_to :category

  has_many :line_items, dependent: :delete_all

  validates :name, presence: true
  validates :price, presence: true, allow_blank: false
  validates :quantity, presence: true
  validates :category, presence: true
end

class Item < ApplicationRecord
  belongs_to :category
  belongs_to :celebrity
  has_many :order_items
  has_many :orders, through: :order_items
  validates :title, presence: true, uniqueness: { scope: :celebrity_id }
  validates :price, presence: true

  def celebrity_name
    celebrity.name
  end
end

class Item < ApplicationRecord
  belongs_to :category
  belongs_to :celebrity
  validates :title, presence: true, uniqueness: { scope: :celebrity_id }
  validates :price, presence: true

  def celebrity_name
    celebrity.name
  end
end

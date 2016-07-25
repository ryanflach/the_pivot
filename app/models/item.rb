class Item < ApplicationRecord
  belongs_to :category
  belongs_to :celebrity
  validates :title, uniqueness: { scope: :celebrity_id }
end

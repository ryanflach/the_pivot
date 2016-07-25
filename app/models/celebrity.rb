class Celebrity < ApplicationRecord
  has_many :items
  has_many :categories, through: :items
  validates :name, presence: true, uniqueness: true
end

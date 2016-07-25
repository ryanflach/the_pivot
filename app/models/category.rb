class Category < ApplicationRecord
  has_many :items
  has_many :celebrities, through: :items
  validates :title, presence: true, uniqueness: true
end

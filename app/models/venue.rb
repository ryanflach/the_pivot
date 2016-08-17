class Venue < ApplicationRecord
  has_many :events
  has_many :categories, through: :events
  validates :name, presence: true, uniqueness: true
  validates :image_path, presence: true
  validates :city, presence: true
  validates :state, presence: true

  def location
    "#{city}, #{state}"
  end
end

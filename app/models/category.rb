class Category < ApplicationRecord
  has_many :items
  has_many :celebrities, through: :items
  validates :title, presence: true, uniqueness: true
  validates :slug, presence: true, uniqueness: { case_sensitive: false }
  before_validation :create_slug

  def to_param
    slug
  end

  private

  def create_slug
    self.slug = title.parameterize if title
  end
end

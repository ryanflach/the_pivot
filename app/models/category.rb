class Category < ApplicationRecord
  has_many :items
  has_many :celebrities, through: :items
  validates :title, presence: true, uniqueness: true
  # attr_accessor :title

  def slug
    title.capitalize.gsub(" ", "-")
  end

  def to_param
    # "#{slug}"
    slug.to_s
    # parameterize(params[:title])
  end
end

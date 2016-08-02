class Item < ApplicationRecord
  belongs_to :category
  belongs_to :celebrity
  has_many :order_items
  has_many :orders, through: :order_items
  has_attached_file :upload_image, default_url: 'http://i.imgur.com/5p6sEsX.jpg'
  validates :title, presence: true, uniqueness: { scope: :celebrity_id }
  validates :price, presence: true
  validates :category, presence: true
  validates :celebrity, presence: true
  validates_attachment_content_type :upload_image, :content_type => /\Aimage\/.*\Z/

  before_create :set_image_path

  enum status: %w(available unavailable)

  def celebrity_name
    celebrity.name
  end

  def sold_out?
    status == 'unavailable'
  end

  def set_image_path
    self.image_path = self.upload_image.url unless self.image_path
  end
end

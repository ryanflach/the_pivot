class Event < ApplicationRecord
  belongs_to :category
  belongs_to :venue
  has_many :order_events
  has_many :orders, through: :order_events
  has_attached_file :upload_image, default_url: 'http://i.imgur.com/5p6sEsX.jpg'
  validates :title, presence: true, uniqueness: { scope: :venue_id }
  validates :price, presence: true
  validates :category, presence: true
  validates :venue, presence: true
  validates_attachment_content_type :upload_image, :content_type => /\Aimage\/.*\Z/

  after_create :set_image_path

  enum status: %w(upcoming occurred)

  def venue_name
    venue.name
  end

  def past_event?
    status == 'occurred'
  end

  def update_image_path
    unless upload_image.url == 'http://i.imgur.com/5p6sEsX.jpg'
      update_image
    end
  end

  def set_image_path
    update_image unless image_path
  end

  private

  def update_image
    update(image_path: upload_image.url)
  end
end
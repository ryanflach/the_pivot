class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items

  def date
    created_at.strftime("%m/%d/%Y")
  end

  def item_count(item)
    items.where(id: item).count
  end

  def sub_total(item)
    item_count(item) * item.price
  end

  def total
    items.sum(:price)
  end

  def unique_items
    self.items.uniq
  end

end

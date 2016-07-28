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

  def sub_tot(item)
    item_count(item).to_f * item.price.to_f
  end

  def tot
    items.sum(:price).to_f
  end

end

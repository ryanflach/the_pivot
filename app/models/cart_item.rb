class CartItem < SimpleDelegator
  attr_reader :quantity

  def initialize(item_id, quantity)
    @item = Item.find(item_id.to_i)
    @quantity = quantity
    super(@item)
  end

  def sub_total
    price * quantity
  end
end

require 'rails_helper'

RSpec.describe Order, type: :model do
  it { should belong_to :user }
  it { should have_many(:events).through(:order_events) }
  it { should have_many :order_events }

  it "should default to ordered status" do
    order = create(:order)
    expect(order.status).to eq("Ordered")
  end
end

require 'rails_helper'

RSpec.describe Item, type: :model do
  it { should belong_to :celebrity }
  it { should belong_to :category }
  it { should have_many :order_items }
  it { should have_many(:orders).through(:order_items) }
  it { should validate_uniqueness_of(:title).scoped_to(:celebrity_id) }
  it { should validate_presence_of :price }
  it { should validate_presence_of :title }
  it { should respond_to :celebrity_name }
end

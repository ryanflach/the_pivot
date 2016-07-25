require 'rails_helper'

RSpec.describe Celebrity, type: :model do
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }
  it { should have_many :items }
  it { should have_many(:categories).through(:items) }
end

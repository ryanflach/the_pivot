require 'rails_helper'

RSpec.describe Venue, type: :model do
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }
  it { should have_many :events }
  it { should have_many(:categories).through(:events) }
  it { should validate_presence_of :image_path }
end

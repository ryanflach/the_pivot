require 'rails_helper'

RSpec.describe Item, type: :model do
  it { should belong_to :celebrity }
  it { should belong_to :category }
  it { should validate_uniqueness_of(:title).scoped_to(:celebrity_id) }
end

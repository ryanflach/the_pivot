require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of :username }
  it { should validate_uniqueness_of :username }
  it { should validate_presence_of :email }
  it { should validate_uniqueness_of :email }
  it { should have_secure_password }
  it { should validate_length_of :state }
  it { should validate_length_of :zip_code }
  it { should have_many :orders }
end

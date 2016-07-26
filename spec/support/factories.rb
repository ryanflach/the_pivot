FactoryGirl.define do
  factory :item do
    title
    description "Definitely used by this celebrity at least once"
    price 199.99
    image_path
    category
    celebrity
  end

  factory :celebrity do
    name
  end

  factory :category do
    title { generate(:category_title) }
  end

  sequence :name do |n|
    "Celebrity_#{n}"
  end

  sequence :category_title do |n|
    "Category_#{n}"
  end

  sequence :title do |n|
    "Item_#{n}"
  end

  sequence :image_path do |n|
    "https://robohash.org/#{n}"
  end
end

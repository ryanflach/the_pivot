def category_selection
  [
    { title: "Cleaning Supplies" },
    { title: "Kitchen" },
    { title: "Personal Hygiene" },
    { title: "Clothing" },
    { title: "Tools" },
    { title: "Refuse" },
    { title: "Miscellaneous" }
  ]
end

category_selection.each { |cat| Category.create(cat) }

5.times do
  Celebrity.create(name: Faker::Name.name)
end

20.times do
  Item.create(
    title: Faker::Commerce.product_name,
    description: Faker::Hipster.paragraph,
    price: Faker::Commerce.price.to_f,
    image_path: Faker::Avatar.image,
    category_id: Category.all.sample.id,
    celebrity_id: Celebrity.all.sample.id
  )
end

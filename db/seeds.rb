wellness = Category.create(title: 'Wellness')
cleaning = Category.create(title: 'Cleaning')
bathroom = Category.create(title: 'Bathroom')
entertainment = Category.create(title: 'Entertainment')

jt = Celebrity.create(name: 'Justin Timberlake')
jtt = Celebrity.create(name: 'Jonathan Taylor Thomas')
attenborough = Celebrity.create(name: 'Sir David Attenborough')

Item.create(
  title: 'Broken Swiffer',
  description: "When times are tough and you're cleaning your own home,\
  it's easy to imagine the frustration that arises when your trusty \
  Swiffer finally scrubs its last floor. But with great frustration \
  comes great perspiration, and JTT's sweat on this one-of-a-kind item \
  is what makes it truly special.",
  price: 44.99,
  image_path: 'http://i.imgur.com/ymvr4Qd.jpg',
  category: cleaning,
  celebrity: jtt
)

Item.create(
  title: 'Half-full Throat Spray',
  description: "You know him from every nature documentary ever \
  produced, and now you can unlock the secret behind his buttery, \
  informative voice with this partially-used bottle of throat coat \
  spray. You won't quite be kissing Mr. Attenborough, but sharing \
  this bottle will surely be enough to pique the interests of even \
  your most staunch dinner guests.",
  price: 109.99,
  image_path: 'http://i.imgur.com/69bNRtH.jpg',
  category: wellness,
  celebrity: attenborough
)

Item.create(
  title: 'Malfunctioning Bidet',
  description: "Perhaps one of our greatest treasures: hit-maker, \
  actor, and all-around world superstar Justin Timberlake's personal \
  bidet. Although tempting, this particular item is not recommended \
  for use, due to the malfunction of the pressure limiter of the spray \
  nozzle. Buyer beware, this rare gem comes with a scare!",
  price: 1099.99,
  image_path: 'http://i.imgur.com/LeTdTmw.jpg',
  category: bathroom,
  celebrity: jt,
  status: 1
)

Item.create(
  title: 'Justin Timberlake N*Sync Doll',
  description: "Worlds have collided with this unique item. Owned by \
  Sir David Attenborough, revealing both his good taste and a rare \
  glimpse into his private taste in both music and style is this \
  N*Sync era doll of Justin Timberlake. Originally equipped with a \
  pull string that would deliver snippets of songs, this feature is \
  no longer functioning due to overuse by Mr. Attenborough.",
  price: 249.99,
  image_path: 'http://i.imgur.com/bOZoSV8.jpg',
  category: entertainment,
  celebrity: attenborough
)

Item.create(
  title: 'Glee Season 2 Soundtrack (CD)',
  description: "Priced at a very special fifty-TWO dollars, this CD \
  shows plenty of scratches from apparent regular use by superstar \
  Justin Timberlake. Making this item extra special, the liner notes \
  have all original song titles scratched out and replaced with the \
  words 'Cry Me a River'.",
  price: 52.00,
  image_path: 'http://i.imgur.com/cLgVDRa.png',
  category: entertainment,
  celebrity: jt
)

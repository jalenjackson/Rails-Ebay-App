Product.delete_all

i = 0
30.times do
  i += 1
  Product.create(title: "A new product #{i}", description: 'Check me out',image_url: 'cool.jpg', price: 23.40)
end
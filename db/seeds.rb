Product.delete_all


30.times do
  Product.create(title: 'A new product', description: 'Check me out',image_url: 'cool.jpg', price: 23.40)
end
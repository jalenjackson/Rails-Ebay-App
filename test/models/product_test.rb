require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  fixtures :products

  #check if products are not empty
  #check if products are greater than or equal to 0.01
  #check if images have proper file extensions
  #check if products title is unique

  test 'products must not be empty !' do
    products = Product.new
    products.invalid?
    assert products.errors[:title].any?
    assert products.errors[:description].any?
    assert products.errors[:price].any?
    assert products.errors[:image_url].any?
  end

  test 'products must be greater than or equal to 0.01 ' do
    products = Product.new(title:'a new product',description: 'yyy', image_url: 'cool.jpg')
    products.price = -1
    assert products.invalid?
    assert products.errors[:price].any?
    assert_equal ['must be greater than or equal to 0.01'],
        products.errors[:price]
    products.price = 0
    assert products.invalid?
    assert products.errors[:price].any?
    assert_equal ['must be greater than or equal to 0.01'],
                 products.errors[:price]
    products.price = 1
    assert products.valid?
  end

  def create_product(image_url)
    Product.new(title:'a new productssssss',description:'yyy', price: 1, image_url: image_url)
  end
  test 'products have proper file extensions ' do
    good = %w(a.jpg a.gif a.png a.JPG a.Jpg a.PNG a.Png)
    bad = %w(a.doc a.docx a.mp4 a.mp3 a.mov a.pdf)

    good.each do |g|
      assert create_product(g).valid?
    end
    bad.each do |b|
      assert create_product(b).invalid?
    end
  end

  test 'products title must be unique' do
    products = Product.new(title: products(:ruby).title, description: 'yyy', price: 1, image_url: 'cool.jpg')
    assert products.invalid?
  end
end

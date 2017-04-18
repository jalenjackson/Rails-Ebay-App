class Product < ApplicationRecord
  validates :title, :description, :image_url , presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :title, uniqueness: true
  validates :title, length: { minimum: 10 , message: 'must be at least 10 characters please ' }
  validates :image_url, allow_blank: true, format: {
      with: %r(\.(gif|jpg|png)\Z)i,
      message:  'Must be a url with gif, jpg , or png'
  }
end

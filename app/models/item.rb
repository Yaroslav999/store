class Item < ApplicationRecord
  belongs_to :category
  mount_uploader :image, ImageUploader
  validates :name, :body, :price, presence: true
end

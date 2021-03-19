class Cat < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :gender
  has_one_attached :image

  validates :name, :birthday, :image, presence: true

  validates :gender_id, numericality: { other_than: 1 }
end

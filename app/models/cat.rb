class Cat < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :gender
  has_one_attached :image
  has_many :healths, dependent: :destroy
  belongs_to :user
  
  with_options presence: true do
   validates :name, :birthday, :image
   validates :gender_id, numericality: { other_than: 1 }
  end
end

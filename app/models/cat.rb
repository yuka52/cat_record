class Cat < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :gender

  validates :name, :birthday, presence: true

  validates :gender_id, numericality: { other_than: 1 }
end

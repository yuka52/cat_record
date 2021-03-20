class Health < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :food
  belongs_to :tulle
  belongs_to :play
  belongs_to :poop
  belongs_to :pee

  validates :recorded_date, :food_id, :tulle_id, :play_id, :poop_id, :pee_id, presence: true
  validates :food_id, :tulle_id, :play_id, :poop_id, :pee_id, numericality: { other_than: 1 }
end

class Health < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtentions
  belongs_to :food
  belongs_to :tulle
  belongs_to :play
  belongs_to :poop
  belongs_to :pee

  validates :date, :food_id, :tulle_id, :play_id, :poop_id, :pee_id, presence: true
  validates :food_id, :tulle_id, :play_id, :poop_id, :pee_id, numericality: { other_than: 1 }
end

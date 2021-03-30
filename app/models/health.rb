class Health < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :food
  belongs_to :tulle
  belongs_to :play
  belongs_to :poop
  belongs_to :pee
  belongs_to :cat
  belongs_to :user

  with_options presence: true do
   validates :recorded_date, :food_id, :tulle_id, :play_id, :poop_id, :pee_id, :cat_id
   validates :food_id, :tulle_id, :play_id, :poop_id, :pee_id, numericality: { other_than: 1 }
  end
end

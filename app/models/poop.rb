class Poop < ActiveHash::Base
  self.data = [
    { id: 1, name: '--'},
    { id: 2, name: '０回'},
    { id: 3, name: '１回'},
    { id: 4, name: '２回'},
    { id: 5, name: '３回'}
  ]

  include ActiveHash::Associations
  has_many :healths
end
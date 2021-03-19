class Tulle < ActiveHash::Base
  self.data = [
    { id: 1, name: '--'},
    { id: 2, name: '０本'},
    { id: 3, name: '１本'},
    { id: 4, name: '２本'},
    { id: 5, name: '３本'}
  ]

  include ActiveHash::Associations
  has_many :healths
end
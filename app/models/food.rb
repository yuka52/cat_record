class Food < ActiveHash::Base
  self.data = [
    { id: 1, name: '--'},
    { id: 2, name: 'いっぱい食べた'},
    { id: 3, name: 'ふつうに食べた'},
    { id: 4, name: 'すこし食べた'},
    { id: 5, name: '食べなかった'}
  ]

  include ActiveHash::Associations
  has_many :healths
end
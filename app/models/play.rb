class Play < ActiveHash::Base
  self.data = [
    { id: 1, name: '--'},
    { id: 2, name: '５分以下'},
    { id: 3, name: '５〜１０分'},
    { id: 4, name: '１０〜２０分'},
    { id: 5, name: '２０〜３０分'},
    { id: 6, name: '３０分以上'}
  ]

  include ActiveHash::Associations
  has_many :healths
end
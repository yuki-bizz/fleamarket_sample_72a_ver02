class DeliveryWay < ActiveHash::Base
  self.data = [
    {id: 1, name: 'クロネコヤマト'}, {id: 2, name: 'ゆうパック'}, {id: 3, name: '佐川急便'}
  ]
end
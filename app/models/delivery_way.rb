class DeliveryWay < ActiveHash::Base
  self.data = [
    {id: "0", name: '入力して下さい'}, {id: 1, name: 'クロネコヤマト'}, {id: 2, name: 'ゆうパック'}, {id: 3, name: '佐川急便'}
  ]
end
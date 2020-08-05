class DeliveryDate < ActiveHash::Base
  self.data = [
    {id: 1, name: '1日~2日で発送'}, {id: 2, name: '2日~3日で発送'}, {id: 3, name: '4日~7日で発送'}
  ]
end
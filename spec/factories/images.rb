FactoryBot.define do

  factory :image do
    goods_item            {"11"}
    src  {File.open("#{Rails.root}/public/images/test_image.png")}
  end

end
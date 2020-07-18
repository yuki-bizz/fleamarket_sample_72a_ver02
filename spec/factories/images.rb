FactoryBot.define do

  factory :image do
    src  {File.open("#{Rails.root}/public/images/test_image.png")}
  end

end
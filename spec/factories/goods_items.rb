FactoryBot.define do

  factory :goods_item do
    # user_id               {"11"}
    name                  {"パス"}
    explanation           {"aaaabbbccccddddeeee"}
    category_id              {"3"}
    brand                 {"aaaaaaaaa"}
    condition_id             {"11"}
    shipping_fee_id          {"11"}
    province_id              {"11"}
    delivery_way_id       {"11"}
    delivery_date_id         {"11"}
    selling_price         {"000000000"}
    status                {"aaaaaaaaa"}
    seller_id             {"11"}
    buyer_id              {"11"}
    user

    after(:build) do |goods_item|
      goods_item.images << build_list(:image, 3)
    end

  end

  factory :goods_item_no_image, class: GoodsItem do
    name                  {"パス"}
    explanation           {"aaaabbbccccddddeeee"}
    category_id              {"3"}
    brand                 {"aaaaaaaaa"}
    condition_id             {"11"}
    shipping_fee_id          {"11"}
    province_id              {"11"}
    delivery_way_id       {"11"}
    delivery_date_id         {"11"}
    selling_price         {"000000000"}
    status                {"aaaaaaaaa"}
    seller_id             {"11"}
    buyer_id              {"11"}
    user
  end
end
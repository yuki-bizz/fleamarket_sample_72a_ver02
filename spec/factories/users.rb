FactoryBot.define do

  factory :user do
    nickname                   {"てすてぃん"}
    email                      {"kkk@gmail.com"}
    password                   {"00sss00abii00"}
    password_confirmation      {"00sss00abii00"}
    family_name                {"加添"}
    first_name                 {"登録"}
    family_name_kana           {"カゾエ"}
    first_name_kana            {"トウロク"}
    birth_year                 {"1982"}
    birth_month                {"2"}
    birth_day                  {"22"}
    postcode                   {"111-1111"}
    province                   {"福島県"}
    city                       {"ほくわく市"}
    address1                   {"333番地"}
    address2                   {"むむむピル"}
    delivery_family_name       {"長谷川"}
    delivery_first_name        {"直子"}
    delivery_family_name_kana  {"ハセガワ"}
    delivery_first_name_kana   {"ナオコ"}
    tellphone_number           {"09000000000"}
  end

end
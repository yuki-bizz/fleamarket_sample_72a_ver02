require 'test_helper'

class GoodsItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get goods_items_index_url
    assert_response :success
  end

  test "should get show" do
    get goods_items_show_url
    assert_response :success
  end

  test "should get new" do
    get goods_items_new_url
    assert_response :success
  end

  test "should get create" do
    get goods_items_create_url
    assert_response :success
  end

  test "should get purchase" do
    get goods_items_purchase_url
    assert_response :success
  end

  test "should get pay" do
    get goods_items_pay_url
    assert_response :success
  end

end

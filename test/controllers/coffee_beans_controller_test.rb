require 'test_helper'

class CoffeeBeansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @coffee_bean = coffee_beans(:one)
  end

  test "should get index" do
    get coffee_beans_url
    assert_response :success
  end

  test "should get new" do
    get new_coffee_bean_url
    assert_response :success
  end

  test "should create coffee_bean" do
    assert_difference('CoffeeBean.count') do
      post coffee_beans_url, params: { coffee_bean: { description: @coffee_bean.description, image: @coffee_bean.image, name: @coffee_bean.name, slug: @coffee_bean.slug } }
    end

    assert_redirected_to coffee_bean_url(CoffeeBean.last)
  end

  test "should show coffee_bean" do
    get coffee_bean_url(@coffee_bean)
    assert_response :success
  end

  test "should get edit" do
    get edit_coffee_bean_url(@coffee_bean)
    assert_response :success
  end

  test "should update coffee_bean" do
    patch coffee_bean_url(@coffee_bean), params: { coffee_bean: { description: @coffee_bean.description, image: @coffee_bean.image, name: @coffee_bean.name, slug: @coffee_bean.slug } }
    assert_redirected_to coffee_bean_url(@coffee_bean)
  end

  test "should destroy coffee_bean" do
    assert_difference('CoffeeBean.count', -1) do
      delete coffee_bean_url(@coffee_bean)
    end

    assert_redirected_to coffee_beans_url
  end
end

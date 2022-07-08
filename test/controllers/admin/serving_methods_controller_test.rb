require 'test_helper'

class Admin::ServingMethodsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_serving_method = admin_serving_methods(:one)
  end

  test "should get index" do
    get admin_serving_methods_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_serving_method_url
    assert_response :success
  end

  test "should create admin_serving_method" do
    assert_difference('Admin::ServingMethod.count') do
      post admin_serving_methods_url, params: { admin_serving_method: { description: @admin_serving_method.description, image: @admin_serving_method.image, name: @admin_serving_method.name, slug: @admin_serving_method.slug } }
    end

    assert_redirected_to admin_serving_method_url(Admin::ServingMethod.last)
  end

  test "should show admin_serving_method" do
    get admin_serving_method_url(@admin_serving_method)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_serving_method_url(@admin_serving_method)
    assert_response :success
  end

  test "should update admin_serving_method" do
    patch admin_serving_method_url(@admin_serving_method), params: { admin_serving_method: { description: @admin_serving_method.description, image: @admin_serving_method.image, name: @admin_serving_method.name, slug: @admin_serving_method.slug } }
    assert_redirected_to admin_serving_method_url(@admin_serving_method)
  end

  test "should destroy admin_serving_method" do
    assert_difference('Admin::ServingMethod.count', -1) do
      delete admin_serving_method_url(@admin_serving_method)
    end

    assert_redirected_to admin_serving_methods_url
  end
end

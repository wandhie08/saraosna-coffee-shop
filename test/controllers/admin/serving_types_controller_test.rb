require 'test_helper'

class Admin::ServingTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_serving_type = admin_serving_types(:one)
  end

  test "should get index" do
    get admin_serving_types_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_serving_type_url
    assert_response :success
  end

  test "should create admin_serving_type" do
    assert_difference('Admin::ServingType.count') do
      post admin_serving_types_url, params: { admin_serving_type: { bean: @admin_serving_type.bean, description: @admin_serving_type.description, image: @admin_serving_type.image, name: @admin_serving_type.name, result: @admin_serving_type.result, serving_method_id: @admin_serving_type.serving_method_id, slug: @admin_serving_type.slug } }
    end

    assert_redirected_to admin_serving_type_url(Admin::ServingType.last)
  end

  test "should show admin_serving_type" do
    get admin_serving_type_url(@admin_serving_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_serving_type_url(@admin_serving_type)
    assert_response :success
  end

  test "should update admin_serving_type" do
    patch admin_serving_type_url(@admin_serving_type), params: { admin_serving_type: { bean: @admin_serving_type.bean, description: @admin_serving_type.description, image: @admin_serving_type.image, name: @admin_serving_type.name, result: @admin_serving_type.result, serving_method_id: @admin_serving_type.serving_method_id, slug: @admin_serving_type.slug } }
    assert_redirected_to admin_serving_type_url(@admin_serving_type)
  end

  test "should destroy admin_serving_type" do
    assert_difference('Admin::ServingType.count', -1) do
      delete admin_serving_type_url(@admin_serving_type)
    end

    assert_redirected_to admin_serving_types_url
  end
end

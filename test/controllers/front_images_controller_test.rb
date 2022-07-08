require 'test_helper'

class FrontImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @front_image = front_images(:one)
  end

  test "should get index" do
    get front_images_url
    assert_response :success
  end

  test "should get new" do
    get new_front_image_url
    assert_response :success
  end

  test "should create front_image" do
    assert_difference('FrontImage.count') do
      post front_images_url, params: { front_image: { image: @front_image.image, name: @front_image.name, published: @front_image.published, slug: @front_image.slug } }
    end

    assert_redirected_to front_image_url(FrontImage.last)
  end

  test "should show front_image" do
    get front_image_url(@front_image)
    assert_response :success
  end

  test "should get edit" do
    get edit_front_image_url(@front_image)
    assert_response :success
  end

  test "should update front_image" do
    patch front_image_url(@front_image), params: { front_image: { image: @front_image.image, name: @front_image.name, published: @front_image.published, slug: @front_image.slug } }
    assert_redirected_to front_image_url(@front_image)
  end

  test "should destroy front_image" do
    assert_difference('FrontImage.count', -1) do
      delete front_image_url(@front_image)
    end

    assert_redirected_to front_images_url
  end
end

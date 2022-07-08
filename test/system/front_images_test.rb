require "application_system_test_case"

class FrontImagesTest < ApplicationSystemTestCase
  setup do
    @front_image = front_images(:one)
  end

  test "visiting the index" do
    visit front_images_url
    assert_selector "h1", text: "Front Images"
  end

  test "creating a Front image" do
    visit front_images_url
    click_on "New Front Image"

    fill_in "Image", with: @front_image.image
    fill_in "Name", with: @front_image.name
    check "Published" if @front_image.published
    fill_in "Slug", with: @front_image.slug
    click_on "Create Front image"

    assert_text "Front image was successfully created"
    click_on "Back"
  end

  test "updating a Front image" do
    visit front_images_url
    click_on "Edit", match: :first

    fill_in "Image", with: @front_image.image
    fill_in "Name", with: @front_image.name
    check "Published" if @front_image.published
    fill_in "Slug", with: @front_image.slug
    click_on "Update Front image"

    assert_text "Front image was successfully updated"
    click_on "Back"
  end

  test "destroying a Front image" do
    visit front_images_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Front image was successfully destroyed"
  end
end

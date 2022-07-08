require "application_system_test_case"

class Admin::ServingMethodsTest < ApplicationSystemTestCase
  setup do
    @admin_serving_method = admin_serving_methods(:one)
  end

  test "visiting the index" do
    visit admin_serving_methods_url
    assert_selector "h1", text: "Admin/Serving Methods"
  end

  test "creating a Serving method" do
    visit admin_serving_methods_url
    click_on "New Admin/Serving Method"

    fill_in "Description", with: @admin_serving_method.description
    fill_in "Image", with: @admin_serving_method.image
    fill_in "Name", with: @admin_serving_method.name
    fill_in "Slug", with: @admin_serving_method.slug
    click_on "Create Serving method"

    assert_text "Serving method was successfully created"
    click_on "Back"
  end

  test "updating a Serving method" do
    visit admin_serving_methods_url
    click_on "Edit", match: :first

    fill_in "Description", with: @admin_serving_method.description
    fill_in "Image", with: @admin_serving_method.image
    fill_in "Name", with: @admin_serving_method.name
    fill_in "Slug", with: @admin_serving_method.slug
    click_on "Update Serving method"

    assert_text "Serving method was successfully updated"
    click_on "Back"
  end

  test "destroying a Serving method" do
    visit admin_serving_methods_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Serving method was successfully destroyed"
  end
end

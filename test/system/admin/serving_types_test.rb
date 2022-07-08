require "application_system_test_case"

class Admin::ServingTypesTest < ApplicationSystemTestCase
  setup do
    @admin_serving_type = admin_serving_types(:one)
  end

  test "visiting the index" do
    visit admin_serving_types_url
    assert_selector "h1", text: "Admin/Serving Types"
  end

  test "creating a Serving type" do
    visit admin_serving_types_url
    click_on "New Admin/Serving Type"

    fill_in "Bean", with: @admin_serving_type.bean
    fill_in "Description", with: @admin_serving_type.description
    fill_in "Image", with: @admin_serving_type.image
    fill_in "Name", with: @admin_serving_type.name
    fill_in "Result", with: @admin_serving_type.result
    fill_in "Serving method", with: @admin_serving_type.serving_method_id
    fill_in "Slug", with: @admin_serving_type.slug
    click_on "Create Serving type"

    assert_text "Serving type was successfully created"
    click_on "Back"
  end

  test "updating a Serving type" do
    visit admin_serving_types_url
    click_on "Edit", match: :first

    fill_in "Bean", with: @admin_serving_type.bean
    fill_in "Description", with: @admin_serving_type.description
    fill_in "Image", with: @admin_serving_type.image
    fill_in "Name", with: @admin_serving_type.name
    fill_in "Result", with: @admin_serving_type.result
    fill_in "Serving method", with: @admin_serving_type.serving_method_id
    fill_in "Slug", with: @admin_serving_type.slug
    click_on "Update Serving type"

    assert_text "Serving type was successfully updated"
    click_on "Back"
  end

  test "destroying a Serving type" do
    visit admin_serving_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Serving type was successfully destroyed"
  end
end

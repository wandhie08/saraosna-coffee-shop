require "application_system_test_case"

class CoffeeBeansTest < ApplicationSystemTestCase
  setup do
    @coffee_bean = coffee_beans(:one)
  end

  test "visiting the index" do
    visit coffee_beans_url
    assert_selector "h1", text: "Coffee Beans"
  end

  test "creating a Coffee bean" do
    visit coffee_beans_url
    click_on "New Coffee Bean"

    fill_in "Description", with: @coffee_bean.description
    fill_in "Image", with: @coffee_bean.image
    fill_in "Name", with: @coffee_bean.name
    fill_in "Slug", with: @coffee_bean.slug
    click_on "Create Coffee bean"

    assert_text "Coffee bean was successfully created"
    click_on "Back"
  end

  test "updating a Coffee bean" do
    visit coffee_beans_url
    click_on "Edit", match: :first

    fill_in "Description", with: @coffee_bean.description
    fill_in "Image", with: @coffee_bean.image
    fill_in "Name", with: @coffee_bean.name
    fill_in "Slug", with: @coffee_bean.slug
    click_on "Update Coffee bean"

    assert_text "Coffee bean was successfully updated"
    click_on "Back"
  end

  test "destroying a Coffee bean" do
    visit coffee_beans_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Coffee bean was successfully destroyed"
  end
end

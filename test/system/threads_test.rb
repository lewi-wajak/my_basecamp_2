require "application_system_test_case"

class ThreadsTest < ApplicationSystemTestCase
  setup do
    @thread = threads(:one)
  end

  test "visiting the index" do
    visit threads_url
    assert_selector "h1", text: "Threads"
  end

  test "should create thread" do
    visit threads_url
    click_on "New thread"

    fill_in "Project", with: @thread.project_id
    fill_in "Title", with: @thread.title
    fill_in "User", with: @thread.user_id
    click_on "Create Thread"

    assert_text "Thread was successfully created"
    click_on "Back"
  end

  test "should update Thread" do
    visit thread_url(@thread)
    click_on "Edit this thread", match: :first

    fill_in "Project", with: @thread.project_id
    fill_in "Title", with: @thread.title
    fill_in "User", with: @thread.user_id
    click_on "Update Thread"

    assert_text "Thread was successfully updated"
    click_on "Back"
  end

  test "should destroy Thread" do
    visit thread_url(@thread)
    click_on "Destroy this thread", match: :first

    assert_text "Thread was successfully destroyed"
  end
end

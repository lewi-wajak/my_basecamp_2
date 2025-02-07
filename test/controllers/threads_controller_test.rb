require "test_helper"

class ThreadsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @thread = threads(:one)
  end

  test "should get index" do
    get threads_url
    assert_response :success
  end

  test "should get new" do
    get new_thread_url
    assert_response :success
  end

  test "should create thread" do
    assert_difference("Thread.count") do
      post threads_url, params: { thread: { project_id: @thread.project_id, title: @thread.title, user_id: @thread.user_id } }
    end

    assert_redirected_to thread_url(Thread.last)
  end

  test "should show thread" do
    get thread_url(@thread)
    assert_response :success
  end

  test "should get edit" do
    get edit_thread_url(@thread)
    assert_response :success
  end

  test "should update thread" do
    patch thread_url(@thread), params: { thread: { project_id: @thread.project_id, title: @thread.title, user_id: @thread.user_id } }
    assert_redirected_to thread_url(@thread)
  end

  test "should destroy thread" do
    assert_difference("Thread.count", -1) do
      delete thread_url(@thread)
    end

    assert_redirected_to threads_url
  end
end

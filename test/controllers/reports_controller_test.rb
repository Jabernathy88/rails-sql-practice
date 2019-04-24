require 'test_helper'

class ReportsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get reports_index_url
    assert_response :success
  end

  test "should get count_authors" do
    get reports_count_authors_url
    assert_response :success
  end

  test "should get count_books" do
    get reports_count_books_url
    assert_response :success
  end

  test "should get books_by_topic" do
    get reports_books_by_topic_url
    assert_response :success
  end

  test "should get books_by_topic_summary" do
    get reports_books_by_topic_summary_url
    assert_response :success
  end

  test "should get authors_join_books" do
    get reports_authors_join_books_url
    assert_response :success
  end

  test "should get index_explain" do
    get reports_index_explain_url
    assert_response :success
  end

end

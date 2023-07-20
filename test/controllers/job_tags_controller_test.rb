require "test_helper"

class JobTagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @job_tag = job_tags(:one)
  end

  test "should get index" do
    get job_tags_url
    assert_response :success
  end

  test "should get new" do
    get new_job_tag_url
    assert_response :success
  end

  test "should create job_tag" do
    assert_difference("JobTag.count") do
      post job_tags_url, params: { job_tag: {  } }
    end

    assert_redirected_to job_tag_url(JobTag.last)
  end

  test "should show job_tag" do
    get job_tag_url(@job_tag)
    assert_response :success
  end

  test "should get edit" do
    get edit_job_tag_url(@job_tag)
    assert_response :success
  end

  test "should update job_tag" do
    patch job_tag_url(@job_tag), params: { job_tag: {  } }
    assert_redirected_to job_tag_url(@job_tag)
  end

  test "should destroy job_tag" do
    assert_difference("JobTag.count", -1) do
      delete job_tag_url(@job_tag)
    end

    assert_redirected_to job_tags_url
  end
end

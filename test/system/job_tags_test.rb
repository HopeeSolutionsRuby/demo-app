require "application_system_test_case"

class JobTagsTest < ApplicationSystemTestCase
  setup do
    @job_tag = job_tags(:one)
  end

  test "visiting the index" do
    visit job_tags_url
    assert_selector "h1", text: "Job tags"
  end

  test "should create job tag" do
    visit job_tags_url
    click_on "New job tag"

    click_on "Create Job tag"

    assert_text "Job tag was successfully created"
    click_on "Back"
  end

  test "should update Job tag" do
    visit job_tag_url(@job_tag)
    click_on "Edit this job tag", match: :first

    click_on "Update Job tag"

    assert_text "Job tag was successfully updated"
    click_on "Back"
  end

  test "should destroy Job tag" do
    visit job_tag_url(@job_tag)
    click_on "Destroy this job tag", match: :first

    assert_text "Job tag was successfully destroyed"
  end
end

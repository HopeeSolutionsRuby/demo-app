require 'rails_helper'

RSpec.describe "students/edit", type: :view do
  let(:student) {
    Student.create!(
      name: "MyString",
      age: 1,
      marks: 1
    )
  }

  before(:each) do
    assign(:student, student)
  end

  it "renders the edit student form" do
    render

    assert_select "form[action=?][method=?]", student_path(student), "post" do

      assert_select "input[name=?]", "student[name]"

      assert_select "input[name=?]", "student[age]"

      assert_select "input[name=?]", "student[marks]"
    end
  end
end

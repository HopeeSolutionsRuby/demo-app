require 'rails_helper'

RSpec.describe "doctors/edit", type: :view do
  let(:doctor) {
    Doctor.create!()
  }

  before(:each) do
    assign(:doctor, doctor)
  end

  it "renders the edit doctor form" do
    render

    assert_select "form[action=?][method=?]", doctor_path(doctor), "post" do
    end
  end
end

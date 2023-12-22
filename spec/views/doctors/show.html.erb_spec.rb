require 'rails_helper'

RSpec.describe "doctors/show", type: :view do
  before(:each) do
    assign(:doctor, Doctor.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end

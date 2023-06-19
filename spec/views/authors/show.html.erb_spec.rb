require 'rails_helper'

RSpec.describe "authors/show", type: :view do
  before(:each) do
    assign(:author, Author.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end

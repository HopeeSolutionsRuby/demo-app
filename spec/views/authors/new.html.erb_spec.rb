require 'rails_helper'

RSpec.describe "authors/new", type: :view do
  before(:each) do
    assign(:author, Author.new())
  end

  it "renders new author form" do
    render

    assert_select "form[action=?][method=?]", authors_path, "post" do
    end
  end
end

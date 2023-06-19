require 'rails_helper'

RSpec.describe "authors/edit", type: :view do
  let(:author) {
    Author.create!()
  }

  before(:each) do
    assign(:author, author)
  end

  it "renders the edit author form" do
    render

    assert_select "form[action=?][method=?]", author_path(author), "post" do
    end
  end
end

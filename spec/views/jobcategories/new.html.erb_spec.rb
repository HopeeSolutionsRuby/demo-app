# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'jobcategories/new', type: :view do
  before(:each) do
    assign(:jobcategory, Jobcategory.new)
  end

  it 'renders new jobcategory form' do
    render

    assert_select 'form[action=?][method=?]', jobcategories_path, 'post' do
    end
  end
end

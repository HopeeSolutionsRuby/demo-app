# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'jobcategories/edit', type: :view do
  let(:jobcategory) do
    Jobcategory.create!
  end

  before(:each) do
    assign(:jobcategory, jobcategory)
  end

  it 'renders the edit jobcategory form' do
    render

    assert_select 'form[action=?][method=?]', jobcategory_path(jobcategory), 'post' do
    end
  end
end

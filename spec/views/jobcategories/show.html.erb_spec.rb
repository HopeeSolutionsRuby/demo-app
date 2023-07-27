# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'jobcategories/show', type: :view do
  before(:each) do
    assign(:jobcategory, Jobcategory.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end

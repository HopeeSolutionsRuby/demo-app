# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'jobcategories/index', type: :view do
  before(:each) do
    assign(:jobcategories, [
             Jobcategory.create!,
             Jobcategory.create!
           ])
  end

  it 'renders a list of jobcategories' do
    render
    Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
  end
end

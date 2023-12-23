# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'doctors/index', type: :view do
  before(:each) do
    assign(:doctors, [
             Doctor.create!,
             Doctor.create!
           ])
  end

  it 'renders a list of doctors' do
    render
    Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
  end
end

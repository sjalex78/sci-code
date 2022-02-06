# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'posters/index', type: :view do
  before do
    assign(:posters, [
             Poster.create!(
               title: 'Title',
               author: 'Author',
             ),
             Poster.create!(
               title: 'Title',
               author: 'Author',
             ),
           ],)
  end

  it 'renders a list of posters' do
    render
    assert_select 'tr>td', text: 'Title'.to_s, count: 2
    assert_select 'tr>td', text: 'Author'.to_s, count: 2
  end
end

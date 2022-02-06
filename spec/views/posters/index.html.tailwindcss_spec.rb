# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'posters/index', type: :view do
  before do
    assign(:posters, [
             Poster.create!(
               title: 'Title 1',
               author: 'Author 1',
             ),
             Poster.create!(
               title: 'Title 2',
               author: 'Author 2',
             ),
           ],)
  end

  it 'renders a list of posters' do
    render
    posters = Capybara.string(response).find_all('p').map do |d|
      strong_text = d.find('strong').text
      remaining_text = d.text.sub(strong_text, '').strip
      { strong_text => remaining_text }
    end

    expect(posters).to eq(
      [
        { 'Title:' => 'Title 1' },
        { 'Author:' => 'Author 1' },
        { 'Title:' => 'Title 2' },
        { 'Author:' => 'Author 2' },
      ],
    )
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'posters/show', type: :view do
  before do
    @poster = assign(:poster, Poster.create!(
                                title: 'Title',
                                author: 'Author',
                              ),)
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Author/)
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'posters/edit', type: :view do
  before do
    @poster = assign(:poster, Poster.create!(
                                title: 'MyString',
                                author: 'MyString',
                              ),)
  end

  it 'renders the edit poster form' do
    render

    assert_select 'form[action=?][method=?]', poster_path(@poster), 'post' do
      assert_select 'input[name=?]', 'poster[title]'

      assert_select 'input[name=?]', 'poster[author]'
    end
  end
end

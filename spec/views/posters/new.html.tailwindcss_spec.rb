# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'posters/new', type: :view do
  before do
    assign(:poster, Poster.new(
                      title: 'MyString',
                      author: 'MyString',
                    ),)
  end

  it 'renders new poster form' do
    render

    assert_select 'form[action=?][method=?]', posters_path, 'post' do
      assert_select 'input[name=?]', 'poster[title]'

      assert_select 'input[name=?]', 'poster[author]'
    end
  end
end

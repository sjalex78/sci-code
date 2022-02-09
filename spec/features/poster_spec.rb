require 'rails_helper'

RSpec.describe 'new poster' do
  it 'allows the creation of a science poster, with a title and author name' do
    #visit the app
    visit root_path

    #create poster
    click_on('Create a poster!')
    form = page.find("form[action='#{posters_path}']")
    form.fill_in('poster_title', with: "test_title")
    form.fill_in('poster_author', with: "test_author")
    form.find("input[type='submit']").click

    #successfully
    expect(
      page.find('p#notice')
      .text
    ).to eq "Poster was successfully created."

    #view the poster as a pdf
    click_on('View PDF')
    # TO_DO NEED TO WORK THIS OUT form = page.find("embed[type='application/pdf']")
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'new poster', js: true do
  context 'with a valid user' do
    before do
      User.create! email: 'p@p.com', password: 'password', password_confirmation: 'password'
    end
    it 'allows the user to create science poster' do
      When 'a user visits the app' do
        visit root_path
      end

      Then 'a user can create a new poster' do
        click_on('Create a poster!')
        form = page.find("form[action='#{user_session_path}']")
        form.fill_in('user_email', with: 'p@p.com')
        form.fill_in('user_password', with: 'password')
        # debugger
        form.find("input[type='submit']").click
        form = page.find("form[action='#{posters_path}']")
        form.fill_in('poster_title', with: 'test_title')
        form.fill_in('poster_author', with: 'test_author')
        form.find("input[type='submit']").click
      end

      When 'a poster is sucessfully created' do
        expect(
          page.find('p#notice')
          .text,
        ).to eq 'Poster was successfully created.'
      end

      Then 'a user can view the poster as a pdf' do
        click_on('View PDF')
        # TO_DO NEED TO WORK THIS OUT form = page.find("embed[type='application/pdf']")
      end
    end
  end
end

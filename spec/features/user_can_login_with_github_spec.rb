require 'rails_helper'

describe 'User can log in with with Github', type: :feature do
  scenario 'and is redirected to the user dashboard' do
    stub_omniauth

    visit users_path
    click_link 'Sign in with Github'

    expect(page).to have_content('Kris Sparks')
  end
end

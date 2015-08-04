require 'spec_helper'

feature 'Starting a new game' do
  scenario 'I am asked to enter my name' do
    visit '/'
    click_link 'New Game'
    expect(page).to have_content "What's your name?"
  end

  scenario 'Name is entered/recorded' do
    visit '/NewGame'
    page.fill_in 'Name', :with => name
    expect(page).to have_content(name)
  end
end
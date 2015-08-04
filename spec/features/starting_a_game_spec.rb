require 'spec_helper'

feature 'Starting a new game' do
  scenario 'I am asked to enter my name' do
    visit '/'
    click_link 'New Game'
    expect(page).to have_content "What's your name?"
  end

  scenario 'Name is entered/recorded' do
    visit '/NewGame'
    fill_in 'Name', :with => 'examplename'
    click_button "Submit"
    expect(page).to have_content "examplename"
  end
end
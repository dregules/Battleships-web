require 'spec_helper'

feature 'Starting a new game' do
  let(:player1) {double :player1}

  scenario 'I am asked to enter my name' do
    visit '/'
    click_link 'New Game'
    expect(page).to have_content "What's your name?"
  end

  scenario 'Name is entered/recorded' do
    visit '/NewGame'
    fill_in 'name', :with => 'examplename'
    click_button 'Submit'
    expect(page).to have_content 'examplename'
  end


  scenario 'Name is not entered' do
    visit '/NewGame'
    click_button 'Submit'
    expect(page).to have_content "What's your name?"
  end

  scenario 'when player 1 is the only registered, he should wait for player 2' do
    visit '/NewGame'
    fill_in 'name', :with => 'examplename'
    click_button 'Submit'
    expect(page).to have_content "Wait for Player 2 to register"
  end
end
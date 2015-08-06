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

  # scenario 'name is stored in #session[:player1]' do
  #   byebug
  #   visit '/NewGame'
  #   fill_in 'Name', :with => 'Diego'
  #   click_button 'Submit'
  #   allow(player1).to receive(:name).with('Diego')
  #   expect(session[:player1]).to eq player1.name
  # end



  scenario 'Name is not entered' do
    visit '/NewGame'
    click_button 'Submit'
    expect(page).to have_content "What's your name?"
  end
end
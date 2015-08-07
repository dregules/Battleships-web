require 'spec_helper'
require_relative 'browser'
include Browser

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
    in_browser(:chrome) do
      visit '/NewGame'
      fill_in 'name', :with => 'examplename'
      click_button 'Submit'
      expect(page).to have_content "Wait for Player 2 to register"
    end
  end

  context 'when both players are registered' do
    before do
      in_browser(:chrome) do
        visit '/NewGame'
        fill_in 'name', :with => 'player1'
        click_button 'Submit'
      end
      in_browser(:safari) do
        visit '/NewGame'
        fill_in 'name', :with => 'player2'
        click_button 'Submit'
      end
    end

    scenario 'player 1 should see fire form' do
      in_browser(:chrome) do
        expect(page).to have_content 'Fire'
      end
    end

    scenario 'player 2 should wait for his turn' do
      in_browser(:safari) do
        expect(page).to have_content 'wait'
      end
    end
  end

end
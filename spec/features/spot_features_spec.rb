require 'spec_helper'

feature 'Spot' do
  before do
    visit '/dashboards/new'
    fill_in 'dashboard[name]', with: 'Museums'
    click_button 'Create Dashboard'
  end
  
  scenario 'can be removed from dashboard' do
    visit '/dashboards/1'
    @spot = Dashboard.first
    find('.remove a[href="/dashboards/1/spots/1"]').click
    expect(page).not_to have_css('.remove a[href="/dashboards/1/spots/1"]')
  end

  scenario 'has icon url' do
    @spot = Dashboard.first
    expect(@spot.icon_url).not_to eq(nil)
  end

  scenario 'does not have duplicate tags' do
    @spot = Dashboard.first
    expect(@spot.tags).to_eq (@spot.tags.uniq)
  end
end
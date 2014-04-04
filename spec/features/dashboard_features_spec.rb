require 'spec_helper'

feature 'Dashboard' do
  # driver = Capybara.javascript_driver
  scenario 'new dashboard form' do
    visit '/dashboards'
    click_link('+')
    expect(page).to have_content 'New Dashboard'
  end

  scenario 'create new dashboard' do
    visit '/dashboards/new'
    fill_in 'dashboard[name]', with: 'Museums'
    click_button 'Create Dashboard'
    expect(page).to have_content 'Museums'
  end

  scenario 'shows time only on hover' do
    visit '/dashboards/new'
    fill_in 'dashboard[name]', with: 'Museums'
    click_button 'Create Dashboard'
    expect(page).not_to have_css('.Open p')
    find(:css, '.navbar').hover
    expect(page).to have_css('.Open p')
  end
end

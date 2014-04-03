require 'spec_helper'

feature 'Dashboard' do
  scenario 'create new dashboard' do
    visit '/dashboards'
    click_link('+')
    expect(page).to have_content 'New Dashboard'
  end
end

Then(/^I should see the organization name$/) do
  expect(page).to have_content("BIRDING THE BAY TRAIL")
end

Then(/^I should see the sidebar cards$/) do
  expect(page).to have_content("sidebar")
end

Then(/^I should see the side navigation bar$/) do
  expect(page).to have_css("div#nearby-locations-sidenav")
end

Then(/^I should see the map placeholder$/) do
  expect(page).to have_content("map")
end
Then(/^I should see the organization name$/) do
  expect(page).to have_content("BIRDING THE BAY TRAIL")
end

Then(/^I should see the sidebar placeholder$/) do
  expect(page).to have_content("sidebar")
end

Then(/^I should see the map placeholder$/) do
  expect(page).to have_content("map")
end
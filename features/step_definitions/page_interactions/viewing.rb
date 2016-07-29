Then(/^I see "([^"]*)"$/) do |copy|
  expect(page).to have_content(copy)
end

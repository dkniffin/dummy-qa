Given(/^I have an admin account$/) do
  @user_info = get_user_info(:admin)
end

Given(/^I am at the admin log in page$/) do
  url = get_log_in_url(:admin)
  go_to_url_and_verify(url)
end

When(/^I log in as an admin$/) do
 log_in_with_credentials(@admin_info)
end

Then(/^I am in the admin panel$/) do
  expect(page).to have_content("Admin")
end

Given(/^I have a user account$/) do
  @user_info = get_user_info(:user)
end

Given(/^I am at the user log in screen$/) do
  visit '/user/login' # TODO: correct login path
end

When(/^I log in as a user$/) do
  log_in_with_credentials(@user_info)
end

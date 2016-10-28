When(%r{^I visit "/"$}) do
  visit '/'
end

When(/^I click "(.*?)"$/) do |item|
  click_on(item)
end

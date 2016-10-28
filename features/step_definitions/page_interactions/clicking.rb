When(%r{^I visit "/"$}) do
  visit '/'
end

When(/^I click "(.*?)"$/) do |item|
  puts page.body
  click_on(item)
end

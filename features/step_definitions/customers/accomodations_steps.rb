Given(/^That I logged in as user$/) do
  user = create(:user)
  visit '/'
  fill_in :email, with: user.email
  fill_in :password, with: user.password
  click_on :submit
end

And(/^I am on dashobard page$/) do
  expect(page).to have_content(' Welcome in eHome')
end

When(/^I click on "([^"]*)" link$/) do |arg|
  within '#left_navigation' do
    click_on arg
  end
end

Then(/^I see in accomodations grid my accomodations items$/) do
  within '#accomodations_grid' do
    expect(page).to have_css('tr', count: 0)
  end
end



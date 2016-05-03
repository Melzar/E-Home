Given(/^There is unauthorized customer with accomodation/) do
  @user = create(:user)
  @customer = create(:customer, user: @user)
  @accomodation = create(:accomodation, name: 'Valhalla')
  @customer_accomodation = create(:customer_accomodation, customer: @customer, accomodation: @accomodation)
end

Given(/^There is unauthorized customer without accomodation$/) do
  @user = create(:user)
  @customer = create(:customer, user: @user)
  @accomodation_type_house = create(:accomodation_type, name: 'house')
  @accomodation_type_flat = create(:accomodation_type, name: 'flat')
end


When(/^User log in$/) do
  visit '/'
  fill_in :email, with: @user.email
  fill_in :password, with: @user.password
  click_on :submit
end

Then(/^User see dashboard page$/) do
  expect(page).to have_content(' Welcome in eHome')
end

When(/^User Click on "([^"]*)" link$/) do |arg|
  within '#left_navigation' do
    click_on arg
  end
end

Then(/^User see in accomodations grid accomodations items$/) do
  within '#accomodations_grid' do
    expect(page).to have_css('tr', count: 1)
    within "##{@accomodation.name}" do
      expect(page).to have_content(@accomodation.name)
      expect(page).to have_content(@accomodation.address_1)
      expect(page).to have_content(@accomodation.address_2)
      expect(page).to have_content(@accomodation.city)
      expect(page).to have_content(@accomodation.zip)
      expect(page).to have_content(@accomodation.accomodation_type.name)
    end
  end
end


And(/^Click on "([^"]*)" link$/) do |arg|
  click_on arg
end

And(/^Click on "([^"]*)" button$/) do |arg|
  click_on arg
end

Then(/^User see add new accomodation screen$/) do
  within '#accomodation_add_header' do
    expect(page).to have_content('Provide your new Accomodation details')
  end
end

When(/^User fill "([^"]*)" input with "([^"]*)"$/) do |arg1, arg2|
  fill_in arg1, with: arg2
end

And(/^Select accomodation type "([^"]*)"$/) do |arg|
  find('#ember-power-select-trigger-accomodation_type').click
  within '#ember-power-select-options-accomodation_type' do
    find('li', text: arg).click
  end
end

And(/^User Fill "([^"]*)" input with "([^"]*)"$/) do |arg1, arg2|
  fill_in arg1, with: arg2
end

When(/^Click submit button$/) do
  click_on :submit
end

Then(/^User is redirected to accomodations list$/) do
  expect(page).to have_css('#add_accomodation')
  expect(page).to have_css('#accomodations_grid')
end

And(/^See newly added accomodation data$/) do
  accomodation = Accomodation.first
  within '#accomodations_grid' do
    expect(page).to have_css('tr', count: 1)
    within "##{accomodation.name}" do
      expect(page).to have_content(accomodation.name)
      expect(page).to have_content(accomodation.address_1)
      expect(page).to have_content(accomodation.address_2)
      expect(page).to have_content(accomodation.city)
      expect(page).to have_content(accomodation.zip)
      expect(page).to have_content(accomodation.accomodation_type.name)
    end
  end
end

Then(/^For "([^"]*)" field error should be shown$/) do |arg|
  within "##{arg}_group" do
    expect(page).to have_content("can't be blank")
  end
end

And(/^Submit button should be disabled$/) do
  within '#crud_actions'do
    expect(page).to have_button(:submit, disabled: true)
  end
end

Then(/^"([^"]*)" error disappear$/) do |arg|
  within "##{arg}_group" do
    expect(page).to_not have_content("can't be blank")
  end
end

And(/^Submit button should be enabled$/) do
  within '#crud_actions'do
    expect(page).to have_button(:submit, disabled: false)
  end
end

When(/^User visits "([^"]*)"$/) do |arg|
  visit arg
end

And(/^User logs out$/) do
  within '#top_nav' do
    click_on :logout
  end
end
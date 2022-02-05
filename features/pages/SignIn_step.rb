require_relative '../support/screen_action.rb'

Given('User open amazon.com') do
  maximize_browser()
  open_url("https://www.amazon.com/")
end

And('User Click Sign In') do
  click_SignIn()
end

Then('User input email or phone number {string}') do |email|
  input_email(email)
  sleep(1)
  screenshot(email)
end

And('User Click Continue') do
  click_continue()
end

Then('User input password {string}') do |password|
  input_password(password)
  sleep(1)
  screenshot(password)
end

And('User Click Submit Password') do
  click_Submit()
  validation()
  sleep(1)
  screenshot("result")
end

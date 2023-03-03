require 'test_helper'
require 'capybara/rails'
require 'capybara/minitest'

class SignInTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  setup do
    Capybara.current_driver = :rack_test
  end

  teardown { reset_session! }

  test 'filling out contact form when privacy pass is verified' do
    # privacy pass is meant to _not_ be machine automatable, so we're stubbing in this case
    PrivacyPassRedeemer.expects(:call).with(anything, anything).returns(true)

    visit root_path
    fill_in 'Name', with: 'Elmo'
    fill_in 'Message', with: "here's a message"
    click_button 'Submit'

    assert page.has_content? 'Thank you for your message, Elmo'
  end

  test 'filling out contact form when privacy pass is not verified' do
    # privacy pass is meant to _not_ be machine automatable, so we're stubbing in this case
    PrivacyPassRedeemer.expects(:call).with(anything, anything).returns(false)

    visit root_path
    fill_in 'Name', with: 'Oscar the Bot'
    fill_in 'Message', with: "I'm a bot!"
    click_button 'Submit'

    assert page.has_content?(/we were unable to confirm you are human/)
  end

  teardown do
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end
end

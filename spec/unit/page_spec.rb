# Set up VNC in terminal, open vnc://localhost:5901
# vnc://localhost:5901 "secret"
# docker-compose run --rm unit-tests
require 'capybara'
require 'capybara/dsl'
require 'selenium-webdriver'

include Capybara::DSL
Capybara.app_host = "http://website"
Capybara.run_server = false
Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(
      app,
      #browser: :remote,
      url: "http://#{ENV['SELENIUM_HOST']}:#{ENV['SELENIUM_PORT']}/wd/hub",
      desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(
        "chromeOptions" => {
          "args" => ['--no-default-browser-check',
                     '--disable-dev-shm-usage']
        }
      )
    )
end
Capybara.default_driver = :selenium

describe "Example page render unit tests" do
    it "should show the logo" do
        visit('/')
        expect(page.has_selector? 'a.logo').to be true
    end
end
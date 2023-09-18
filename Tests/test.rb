require 'appium_lib_core'
require 'test/unit'
require 'pry'

CAPABILITIES = {
    platformName: 'ios',
    automationName: 'XCUITest',
    'appium:newCommandTimeout': 600,
    'appium:bundleId': 'de.zurv.appium-input-bug.AppiumInputBug',
    'appium:wdaStartupRetries': 4,
    'appium:wdaStartupRetryInterval': 20000,
    'appium:wdaConnectionTimeout': 360000,
    'appium:wdaLaunchTimeout': 100000,
    'appium:iosInstallPause': 10000
}

SERVER_URL = 'http://localhost:4723/'

def wait(timeout)
  options = {
    timeout:,
    ignore: [
      Selenium::WebDriver::Error::StaleElementReferenceError,
      Selenium::WebDriver::Error::NoSuchElementError
    ]
  }
  Selenium::WebDriver::Wait.new(options)
end

class AppiumTest < Test::Unit::TestCase
  def setup
    @core = ::Appium::Core.for capabilities: CAPABILITIES
    @driver = @core.start_driver server_url: SERVER_URL

    web_context = wait(120).until do
      @driver.available_contexts.detect do |context|
        context.match(/WEBVIEW/)
      end
    end
    @driver.set_context(web_context)
  end

  def teardown
    @driver&.quit
  end

  def test_enterTextAndReadSpan
    @driver.wait { |d| d.find_element :xpath, '//input' }.send_keys("my text")
    assert_equal("my text", @driver.wait { |d| d.find_element :xpath, '//span' }.text)
  end
end

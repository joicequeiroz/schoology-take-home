require "selenium-webdriver"
require "httparty"

After do |scenario|
  # Do something after each scenario.
  if scenario
    $encoded_img = page.driver.browser.screenshot_as(:base64)
    embed("data:image/png;base64,#{$encoded_img}", "image/png")
  end
end

require "selenium-webdriver"
require "active_support/time"

Before("@access_site") do
  visit_page.visit_site
  file = YAML.load_file(File.join(Dir.pwd, "./config/user_data.yml"))
  @user_pass = file["users"]["qa"]
  login_element.with(@user_pass)
end

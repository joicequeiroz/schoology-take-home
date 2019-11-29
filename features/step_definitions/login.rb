Given("I am at the Login Schoology page") do
  visit_page.visit_site
end

When("I fill login with {string}") do |user|
  file = YAML.load_file(File.join(Dir.pwd, "./config/user_data.yml"))
  @user_pass = file["users"][user]
  @user_name = file["users"][user]["username"]
  login_element.with(@user_pass)
end

Then("I should be autenticated") do
  @auth = course_page.welcome
  expect(@auth).to have_content("Welcome to Schoology, Joice Silva!")
end

Then("I should see my user on my homepage") do
  @name = course_page.top_name
  puts @name
  expect(@name).to have_content("Joice Silva")
end

Then("I should see the {string} alert") do |message|
  expect(login_element.message_alert).to eql(message)
end

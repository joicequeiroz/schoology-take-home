When("I want to update a Course") do
  course_page.my_courses
  course_page.create_course
  element_course.fill_in_course
  course_page.menu_course
  course_page.edit_option
end

When("I change some information") do
  sleep 3
  element_course.edit_course
end

When("I remove the information in the {string}") do |upd_fields|
  file = YAML.load_file(File.join(Dir.pwd, "./config/user_data.yml"))
  @data = file["required_fields"][upd_fields]
  element_course.fill_in_course_update_inval(@data)
end

Then("the course will be updated") do
  @course_name = element_course.check_upd_course
  expect(@course_name).to eql(element_course.edit_course + ": Section 1")
end

Then("I should see the following message {string}") do |message|
  expect(element_course.message_alert).to eql(message)
end

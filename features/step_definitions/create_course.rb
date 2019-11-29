When("I access My Course") do
  course_page.my_courses
end

When("I want to create Course") do
  course_page.create_course
end

When("I fill the course with valid_data") do
  element_course.fill_in_course
end

Then("I should see my new course created") do
  @course_name = element_course.check_course
  expect(@course_name).to eql(element_course.name + ": Section 1")
end

When("I do not fill the {string}") do |fields|
  file = YAML.load_file(File.join(Dir.pwd, "./config/user_data.yml"))
  @data = file["required_fields"][fields]
  element_course.fill_in_course_invalid(@data)
  sleep 7
end

Then("I should see alert {string}") do |message|
  expect(element_course.message_alert).to eql(message)
  sleep 7
end

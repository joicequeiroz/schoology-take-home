When("I want to delete a Course") do
  course_page.my_courses
  course_page.create_course
  element_course.fill_in_course
  course_page.delete_option
end

When("I confirm to delete the Course") do
  element_course.confirm_delete
end

When("I want to delete a Course inactive") do
  step "I want to delete a Course"
  step "I confirm to delete the Course"
  course_page.click_inative_course
end

When("I confirm to delete the inative Course") do
  element_course.confirm_delete_inactive
end

Then("I should see my the following message {string}") do |message|
  @check = course_page.message_delete
  expect(@check).to eql(message)
end

Then("the course is inactive") do
  @check = course_page.inative_course
  expect(@check).to eql("Delete\n" + element_course.name)
end

Then("I should see my course inactive") do
  @check = course_page.inative_course
  expect(@check).to be_falsey
end

Then("the course will be completely removed") do
  expect(page).to have_no_css "[id^='section-'] > div > div > span"
end

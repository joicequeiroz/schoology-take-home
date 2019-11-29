class ElementsCourse < SitePrism::Page
  attr_accessor :name

  #Declaring all elements of the new course page.
  element :course_name, "#edit-course-name"
  element :section_name, "#edit-section-name-1"
  element :subject_area, "#edit-subject-area"
  element :level, "#edit-grade-level-range-start"
  element :btn_create, "#edit-submit"

  def initialize
    @name = Faker::Educator.subject
    @name_upd = Faker::Educator.subject
    @section = "Section 1"
  end

  def select_area(area)
    select(area, from: "edit-subject-area")
  end

  def level(name)
    select(name, from: "edit-grade-level-range-start")
  end

  def fill_in_course
    course_name.set @name
    section_name.set " "
    section_name.set @section
    self.select_area("Other")
    self.level("Graduate")
    btn_create.click
  end

  def fill_in_course_invalid(data)
    course_name.set data["course_name"]
    section_name.set " "
    section_name.set data["section_name"]
    self.select_area(data["subject_area"])
    self.level(data["level"])
    btn_create.click
    sleep 5
  end

  def fill_in_course_update(data)
    course_name.set data["course_name"]
    section_name.set " "
    section_name.set data["section_name"]
    self.select_area(data["subject_area"])
    self.level(data["level"])
    btn_create.click
    sleep 5
  end

  def fill_in_course_update_inval(data)
    course_name.set data["course_name"]
    section_name.set " "
    section_name.set data["section_name"]
    self.select_area(data["subject_area"])
    self.level(data["level"])
    btn_create.click
    sleep 5
  end

  def check_course
    find("#center-top > h2 > a").text()
  end

  def edit_course
    course_name.set @name_upd
    btn_create.click
  end

  def cancel_edit_page
    find("a.cancel-btn.sExtlink-processed").click
  end

  def check_upd_course
    cancel_edit_page
    check_course
  end

  def confirm_delete
    find("#popups-0")
    popup = page.driver.browser.window_handles.last
    page.driver.browser.switch_to.window(popup)
    find("#edit-submit").click
    sleep 5
  end

  def confirm_delete_inactive
    find("#popups-1")
    popup = page.driver.browser.window_handles.last
    page.driver.browser.switch_to.window(popup)
    find("#edit-submit").click
  end

  def message_alert
    find("div.message-text").text()
  end
end

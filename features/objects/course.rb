class Course < SitePrism::Page
  element :el_welcome, "#edge-assoc-gs1 div div span span.welcome-header"
  element :el_inative_course, "[id^='course-'] > p.course-info", text: "Delete"
  element :el_menu_option, "[id^='section-'] > div > div > span"
  element :el_top_name, "div > div.LGaPf._3LkKR._17Z60.util-max-width-twenty-characters-2pOJU"
  element :el_click_courses, "div[role=menu] a._3ghFm", text: "My Courses"
  element :el_create_course, "a.link-btn.create-course-btn.add.popups-processed.sExtlink-processed"
  element :el_menu_course, "#s-course-settings > div > span"
  element :el_edit_option, "#s-course-settings > ul > a.s-course-edit.sExtlink-processed"
  element :el_delete_option, "[id^='section-'] > div > ul > li.action-delete > a"
  element :el_inative_course, "[id^='course-'] > p.course-info", text: "Delete"
  element :el_click_inative_course, "[id^='course-'] > p.course-info > a"
  element :el_message_delete, "#center-inner > div.popup-messages-wrapper > div > div.messages-container > table > tbody > tr > td:nth-child(2) > div"

  def welcome
    el_welcome.text()
  end

  def top_name
    el_top_name.text()
  end

  def courses
    click_button "Courses"
  end

  def click_courses
    el_click_courses.click
  end

  def my_courses
    courses
    click_courses
  end

  def create_course
    el_create_course.click
  end

  def menu_course
    el_menu_course.click
  end

  def edit_option
    el_edit_option.click
  end

  def menu_option
    el_menu_option.click
  end

  def delete_option
    my_courses
    menu_option
    el_delete_option.click
  end

  def inative_course
    el_inative_course.text
  end

  def click_inative_course
    el_click_inative_course.click
  end

  def message_delete
    el_message_delete.text()
  end
end

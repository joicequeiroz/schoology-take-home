module Pages
  def visit_page
    @visit ||= VisitSite.new
  end

  def login_element
    @login_element ||= ElementsLogin.new
  end

  def course_page
    @course ||= Course.new
  end

  def element_course
    @element_course ||= ElementsCourse.new
  end
end

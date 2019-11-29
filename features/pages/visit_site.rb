class VisitSite < SitePrism::Page
  def visit_site
    visit CONFIG["site"]
  end
end

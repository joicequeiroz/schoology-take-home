class ElementsLogin < SitePrism::Page
  #Declaring all elements of the login page.
  element :email, "#edit-mail"
  element :password, "#edit-pass"
  element :btn_login, "#edit-submit"

  def with(user)
    email.set user["username"]
    password.set user["password"]
    btn_login.click
  end

  def message_alert
    find(".message-text").text
  end
end

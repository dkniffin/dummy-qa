# TODO: Fill in admin and user credentials
# TODO: Tweak methods as needed
# TODO: Remove comments

module UserHelper
  def get_user_info(type)
    users = {
      admin: {
        email: "",
        password: ""
      },
      user: {
        email: "",
        password: ""
      },
    }

    users[type]
  end

  def log_in_with_credentials(user_info)
    fill_in("email", with: user_info[:email])
    fill_in("password", with: user_info[:password])
    click_button "" # TODO: fill in button name text
  end
end

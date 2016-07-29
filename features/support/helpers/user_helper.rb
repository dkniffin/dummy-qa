# TODO: Fill in admin and user credentials
# TODO: Tweak methods as needed

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
    click_button "Log in"
  end

  def sign_up(user_info)
    fill_in("firstName", with: user_info[:first_name])
    fill_in("lastName", with: user_info[:last_name])
    fill_in("email", with: user_info[:email])
    fill_in("password", with: user_info[:password])
    fill_in("passwordConfirmation", with: user_info[:password])
    click_button "Sign up"
  end
end

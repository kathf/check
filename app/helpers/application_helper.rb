module ApplicationHelper

  def user_greeting
    if current_user.sign_in_count == 1
      "Hi #{current_user.first_name}. Welcome to Check!"
    else
      "Welcome back, #{current_user.first_name}!"
    end
  end

end

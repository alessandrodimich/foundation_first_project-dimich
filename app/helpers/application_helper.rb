module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = APP_NAME
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

def current_user_user_name
  if current_user
    current_user.user_name
  else
    "(Not Logged in)"
  end
end

def first_name_errors(user)
  if user.errors[:first_name].any?
     "#{user.errors[:first_name].count} #{pluralizer(user.errors[:first_name].count, "error")}"
  else
    "No errors"
  end
end

def last_name_errors(user)
  if user.errors[:last_name].any?
     "#{user.errors[:last_name].count.to_s} #{pluralizer(user.errors[:last_name].count, "error")}"
  else
    "No errors"
  end
end

def user_name_errors(user)
  if user.errors[:user_name].any?
     "#{user.errors[:user_name].count.to_s} #{pluralizer(user.errors[:user_name].count, "error")}"
  else
    "No errors"
  end
end

def email_errors(user)
  if user.errors[:email].any?
     "#{user.errors[:email].count.to_s} #{pluralizer(user.errors[:email].count, "error")}"
  else
    "No errors"
  end
end

def password_errors(user)
  if user.errors[:password].any?
     "#{user.errors[:password].count.to_s} #{pluralizer(user.errors[:password].count, "error")}"
  else
    "No errors"
  end
end

# Returns the word pluralized based on the count (only for english)
def pluralizer(count,word)
  if count > 1
    word.pluralize
  else
    word
  end
end

#returns the current model, to use in the _errors partial
def set_current_model(current_model)
  unless current_model.nil?
    @current_model = current_model
  end
end




#   def body_style(body_class)
#     base_body = "body"
#     if body_class.empty?
#       base_body
#     else
#       "#{base_body} class='#{body_class}'"
#     end
#   end

#End of application helper
end




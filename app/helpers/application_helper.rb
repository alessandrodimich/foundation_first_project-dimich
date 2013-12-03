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

#   def body_style(body_class)
#     base_body = "body"
#     if body_class.empty?
#       base_body
#     else
#       "#{base_body} class='#{body_class}'"
#     end
#   end
end




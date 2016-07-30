module ApplicationHelper
  def on_new_user_path?
    request.path == new_user_path
  end
end

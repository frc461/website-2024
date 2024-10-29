module ApplicationHelper
  include EditorJsHelper

  def render_content(json_data)
    unless json_data
    end
    content = JSON.parse json_data
    html = content['blocks'].map do |block|
      block_as_html block
    end
    html.join.html_safe
  end

  def path_exists?(path)
    Rails.application.routes.recognize_path(path)
    true
  rescue ActionController::RoutingError
    false
  end
end

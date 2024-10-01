module ApplicationHelper
  include EditorJsHelper

  def render_content(json_data)
    unless json_data
      return ''
    end
    content = JSON.parse json_data
    html = content['blocks'].map do |block|
      block_as_html block
    end
    html.join.html_safe
  end
end

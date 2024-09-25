module EditorJsHelper
  def block_as_html(block)
    data = block['data']
    case block['type']
    when 'paragraph'
      "<p>#{data['text']}</p>"
    when 'header'
      level = data['level']
      "<h#{level}>#{data['text']}</h#{level}>"
    when 'list'
      list_html data
    when 'quote'
    when 'delimiter'
    when 'table'
    when 'alert'
      alert_html data
    else
      ''
    end
  end

  private

  def list_html(data)
    list_style = data['style'] == 'ordered' ? 'ol' : 'ul'
    items = list_items data
    "<#{list_style}>#{items}</#{list_style}>"
  end

  def list_items(data)
    data['items'].map do |item|
      inner_list = ''
      unless item['items'].empty?
        inner_list = list_items item
      end
      "<li>#{item['content']}#{inner_list}</li>"
    end.join
  end

  def alert_html(data)
    alignment = case data['align']
                when 'left'
                  'start'
                when 'right'
                  'end'
                else
                  data['align']
                end
    "<div class=\"alert alert-#{data['type']} text-#{alignment}\">#{data['message']}</div>"
  end
end

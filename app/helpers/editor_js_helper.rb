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
      list_html data, data['style'] == 'ordered' ? 'ol' : 'ul'
    when 'quote'
      quote_html data
    when 'delimiter'
      '<div class="ce-delimiter cdx-block"></div>'
    when 'table'
      table_html data
    when 'alert'
      alert_html data
    else
      ''
    end
  end

  private

  def list_html(data, list_style)
    items = data['items'].map do |item|
      inner_list = ''
      unless item['items'].empty?
        inner_list = list_html item, list_style
      end
      "<li>#{item['content']}#{inner_list}</li>"
    end.join
    "<#{list_style}>#{items}</#{list_style}>"
  end

  def table_html(data)
    table = data['content'].map do |item|
      inner = item.map do |i|
        "<td>#{i}</td>"
      end.join
      "<tbody>#{inner}</tbody>"
    end.join
    "<table class=\"table table-bordered\">#{table}</table>"
  end

  def quote_html(data)
    alignment = get_alignment_class data['alignment']
    "<figure class=\"text-#{alignment}\">
       <blockquote class=\"blockquote\">
          <p>#{data['text']}</p>
       </blockquote>
       <figcaption class=\"blockquote-footer\">
         #{data['caption']}
       </figcaption>
     </figure>"
  end

  def alert_html(data)
    alignment = get_alignment_class data['align']
    "<div class=\"alert alert-#{data['type']} text-#{alignment}\">#{data['message']}</div>"
  end

  def get_alignment_class(align)
    if align == 'left'
      'start'
    elsif align == 'right'
      'end'
    else
      align
    end
  end
end

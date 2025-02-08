module EditorJsHelper
  def block_as_html(block)
    data = block["data"]
    case block["type"]
    when "paragraph"
      "<p>#{data['text']}</p>"
    when "header"
      level = data["level"]
      "<h#{level}>#{data['text']}</h#{level}>"
    when "list"
      list_html data, data["style"] == "ordered" ? "ol" : "ul"
    when "quote"
      quote_html data
    when "delimiter"
      '<div class="ce-delimiter cdx-block"></div>'
    when "table"
      table_html data
    when "alert"
      alert_html data
    when "image"
      image_html data
    when "card"
      card_html data
    when "embed"
      embed_html data
    else
      ""
    end
  end

  private

  def list_html(data, list_style)
    items = data["items"].map do |item|
      inner_list = ""
      if item["items"]
        inner_list = list_html item, list_style
      end
      "<li>#{item['content']}#{inner_list}</li>"
    end.join
    "<#{list_style}>#{items}</#{list_style}>"
  end

  def table_html(data)
    table = data["content"].map do |item|
      inner = item.map do |i|
        "<td>#{i}</td>"
      end.join
      "<tbody>#{inner}</tbody>"
    end.join
    "<table class=\"table table-bordered\">#{table}</table>"
  end

  def quote_html(data)
    alignment = get_alignment_class data["alignment"]
    <<-HTML
    <figure class="text-#{alignment}>
       <blockquote class=blockquote>
          <p>#{data['text']}</p>
       </blockquote>
       <figcaption class=blockquote-footer>
         #{data['caption']}
       </figcaption>
     </figure>
    HTML
  end

  def image_html(data)
    <<-HTML
    <figure class="figure">
       <img src="#{data['file']['url']}" alt="#{data['caption']}">
       <figcaption class="figure-caption">#{data['caption']}</figcaption>
     </figure>
    HTML
  end

  def alert_html(data)
    alignment = get_alignment_class data["align"]
    "<div class=\"alert alert-#{data['type']} text-#{alignment}\">#{data['message']}</div>"
  end

  def card_html(data)
    <<-HTML
    <div class="card">
      #{card_part(data, 'header') if data['hasHeader']}
      #{card_part(data, 'body')}
      #{card_part(data, 'footer') if data['hasFooter']}
    </div>
    HTML
  end

  def card_part(data, part)
    html = data[part]["blocks"].map do |block|
      block_as_html block
    end.join.html_safe
    "<div class='card-#{part}'>#{html}</div>"
  end

  def get_alignment_class(align)
    if align == "left"
      "start"
    elsif align == "right"
      "end"
    else
      align
    end
  end

  def embed_html(data)
    <<-HTML
    <figure>
      <div class="ratio ratio-16x9">
        <iframe src="#{data['embed']}" width="580" height="320" frameborder="0" allowfullscreen></iframe>
      </div>
      <figcaption class="figure-caption">#{data['caption']}</figcaption>
    </figure>
    HTML
  end
end

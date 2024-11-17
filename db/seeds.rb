# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

include ApplicationHelper

[ "history", "news", "resources", "general resources", "programming resources", "tech resources" ].each do |category_name|
  PageCategory.find_or_create_by!(name: category_name)
end

Dir["db/seeds_json/*/*"].each do |file|
  name = file.delete_prefix("db/seeds_json/").chomp(".json").split('/')
  title = name[1].split('-').length == 1 ? name[1].titleize : name[1].split('-')[-1].titleize
  unless Page.find_by_title(title)
    Page.create!(
      title: title,
      content: File.read(file),
      html_cache: ApplicationHelper.render_content(File.read(file)),
      page_category_id: PageCategory.friendly.find(name[0]).id
    )
  end
  next
end

Dir["db/templates_json/*"].each do |file|
  name = file.delete_prefix("db/templates_json/").chomp(".json")
  unless PageTemplate.find_by_name(name)
    PageTemplate.create!(
      name: name,
      template: File.read(file)
    )
  end
end

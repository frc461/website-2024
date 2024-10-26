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

["history", "news", "resources"].each do |category_name|
  PageCategory.find_or_create_by!(name: category_name)
end

Dir["db/seeds_json/*/*"].each do |file|
  name = file.delete_prefix("db/seeds_json/").chomp(".json").split('/')
  unless Page.find_by_title(name[1].titleize)
    Page.create!(
      title: name[1].titleize,
      content: File.read(file),
      html_cache: ApplicationHelper.render_content(File.read(file)),
      page_category_id: PageCategory.friendly.find(name[0]).id
    )
  end
end

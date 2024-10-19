class Page < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  has_many :page_assets, dependent: :destroy
end

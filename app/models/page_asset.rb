class PageAsset < ApplicationRecord
  has_one_attached :asset
  belongs_to :page, optional: true
end

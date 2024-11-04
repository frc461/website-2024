class Page < ApplicationRecord
  extend FriendlyId
  has_paper_trail ignore: %i[ updated_at content ]

  friendly_id :title, use: %i[slugged history]
  has_many :page_assets, dependent: :destroy
  belongs_to :page_category, optional: true

  validates_presence_of :title
  validates_uniqueness_of :title

  def self.ransackable_attributes(auth_object = nil)
    [ 'html_cache', 'title' ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ 'page_assets' ]
  end

  def should_generate_new_friendly_id?
    title_changed?
  end
end

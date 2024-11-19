class PageTemplate < ApplicationRecord
  has_paper_trail ignore: :updated_at

  validates_presence_of :name
  validates_uniqueness_of :name
  validates_presence_of :template
end

class Category < ApplicationRecord
  validates :name, presence: true, length: { minimum: 5, maximum: 12, allow_blank: true }
  validates_uniqueness_of :name
end

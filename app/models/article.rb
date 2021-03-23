class Article < ApplicationRecord
  validates :author, presence: true, length: { minimum: 3, maximum: 30 }
  validates :title, presence: true, length: { minimum: 6, maximum: 50 }
  validates :description, presence: true, length: { minimum: 10, maximum: 100 }
  validates :text, presence: true, length: { minimum: 10, maximum: 350 }
end
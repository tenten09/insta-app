class Post < ApplicationRecord
  validates :title, presence: true
  validates :title, length: { minimum: 2, maximum: 100}
  validates :title, format: { with: /\A(?!\@)/ }

  validates :body, presence: true
  
  belongs_to :user
end

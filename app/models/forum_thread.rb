class ForumThread < ApplicationRecord
  belongs_to :user
  has_many :forum_posts

  # added for filtering the params
  accepts_nested_attributes_for :forum_posts
  # also need to run the validations for forum_posts
  validates_associated :forum_posts

  validates :subject, presence: true
end

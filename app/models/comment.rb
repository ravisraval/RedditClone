class Comment < ApplicationRecord
  validates :content, presence: true


  belongs_to :author,
  primary_key: :id,
  foreign_key: :author_id,
  class_name: :User

  belongs_to :post

  belongs_to :parent_comment,
  required: false

  has_many :child_comments,
  primary_key: :id,
  foreign_key: :parent_comment_id,
  class_name: :Comment
end

class User < ActiveRecord::Base
  acts_as_authentic

  has_many :meals
  has_many :comments, :as => :commentable
  has_many :comments_authored, :class_name => 'Comment'

  ROLES = %w[admin moderator restricted]

end


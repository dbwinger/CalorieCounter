class Comment < ActiveRecord::Base
  belongs_to :commentable, :polymorphic => true
  belongs_to :user

  validates_presence_of :commentable_id, :commentable_type
end


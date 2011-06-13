class User < ActiveRecord::Base
  acts_as_authentic

  has_many :meals

  ROLES = %w[admin moderator restricted]

end


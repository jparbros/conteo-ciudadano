class Comment < ActiveRecord::Base
  attr_accessible :comment, :commentable_id, :commentable_type
end

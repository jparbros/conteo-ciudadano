class Comment < ActiveRecord::Base
  #
  # Attributes Accesors
  #
  attr_accessible :comment, :commentable_id, :commentable_type
end

class ExternalUrl < ActiveRecord::Base
  belongs_to :box
  attr_accessible :box_id, :url
end

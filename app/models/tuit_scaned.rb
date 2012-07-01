class TuitScaned < ActiveRecord::Base
  attr_accessible :created, :twitter_id

  def create!
    self.created = true
    save
  end
end

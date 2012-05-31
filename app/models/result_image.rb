class ResultImage < ActiveRecord::Base
  #
  # Attributes Accesors
  #
  attr_accessible :box_id, :image

  #
  # Uploaders
  #
  mount_uploader :image, ResultImagesUploader
end

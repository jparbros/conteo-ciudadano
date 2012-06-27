class ResultImage < ActiveRecord::Base
  #
  # Attributes Accesors
  #
  attr_accessible :box_id, :image


  #
  # Uploaders
  #
  mount_uploader :image, ResultImagesUploader

  #
  # Includes
  #
  include Exif

  #
  # Callbacks
  #
  before_save :save_exif

  #
  # Serialize
  #
  serialize :exif

  def save_exif
    exif = hash_exif
  end
end
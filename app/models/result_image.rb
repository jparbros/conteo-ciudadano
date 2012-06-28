class ResultImage < ActiveRecord::Base
  #
  # Attributes Accesors
  #
  attr_accessible :box_id, :image

  #
  # Associations
  #
  belongs_to :box


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

  #
  # Simple audit
  #
  simple_audit username_method: :email do |result_image|
    {image: result_image.image}
  end

  def save_exif
    self.exif = hash_exif
  end
end
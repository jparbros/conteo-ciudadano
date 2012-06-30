class ResultImage < ActiveRecord::Base
  #
  # Attributes Accesors
  #
  attr_accessible :box_id, :blanket

  #
  # Associations
  #
  belongs_to :box


  #
  # Uploaders
  #
  mount_uploader :blanket, ResultImagesUploader

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
    {blanket: result_image.blanket}
  end

  def save_exif
    self.exif = hash_exif
  end
end
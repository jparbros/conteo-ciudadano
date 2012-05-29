class Box < ActiveRecord::Base
  belongs_to :state
  belongs_to :municipality
  attr_accessible :ticket_voting,:state_id,:municipality_id,:number,:location,:secction,:district,:active,:pri,:pan,:prd,:pt,:vem,:movimiento_ciudadano,:nueva_alianza,:otro,:nulo
  
  validates :state_id, :presence => true, :numericality => { :only_integer => true }
  validates :municipality_id, :presence => true, :numericality => {:only_integer => true }
  validates :number, :presence => true, :length => {:maximum =>4}, :numericality => {:only_integer => true }
  validates :secction, :presence => true, :length => {:maximum =>4}, :numericality => {:greater_than => 0, :only_integer => true }
  validates :district, :presence => true, :length => {:maximum =>4}, :numericality => {:greater_than => 0, :only_integer => true }
  validates :pri, :presence => true, :length => {:maximum =>3}, :numericality => {:greater_than_or_equal_to => 0, :only_integer => true }
  validates :pan, :presence => true, :length => {:maximum =>3}, :numericality => {:greater_than_or_equal_to => 0, :only_integer => true }
  validates :prd, :presence => true, :length => {:maximum =>3}, :numericality => {:greater_than_or_equal_to => 0, :only_integer => true }
  validates :pt, :presence => true, :length => {:maximum =>3}, :numericality => {:greater_than_or_equal_to => 0, :only_integer => true }
  validates :vem, :presence => true, :length => {:maximum =>3}, :numericality => {:greater_than_or_equal_to => 0, :only_integer => true }
  validates :movimiento_ciudadano, :presence => true,:length => {:maximum =>3}, :numericality => {:greater_than_or_equal_to => 0, :only_integer => true }
  validates :nueva_alianza, :presence => true, :length => {:maximum =>3}, :numericality => {:greater_than_or_equal_to => 0, :only_integer => true }
  validates :otro, :presence=> true, :length => {:maximum =>3}, :numericality => {:greater_than_or_equal_to => 0, :only_integer => true }
  validates_attachment_presence :ticket_voting
  validates_attachment_content_type :ticket_voting, :content_type=>['image/gif','image/x-png','image/png', 'image/pjpeg','image/jpeg','image/jpg'],:message => "Oops! El formato de la imagen no esta permitido!!"
  validates_attachment_size :ticket_voting, :less_than => 5.megabytes, :message => 'La imagen es muy grande, maximo 5 Mb'
  
  has_attached_file :ticket_voting,
  :styles => {:medium => "500x693>", :thumb => "350x485>" },
  :path => "/home/dotcloud/data/system/:attachment/:id/:style/:filename",
  :url => "/system/:attachment/:id/:style/:filename"
  
  before_save :validate_results
  
  def validate_results
    votes = 0
    flag = true
    votes = self.pri + self.pan + self.prd + self.vem + self.pt + self.movimiento_ciudadano + self.nueva_alianza + self.otro
    if votes > 750 || votes < 0
      self.errors.add(:base, "La suma de todos los votos no debe ser mayor a 750 en la casilla")
      flag = false
    end
    return flag
  end
  
end
# encoding: UTF-8
class Box < ActiveRecord::Base

  include GoogleMaps
  include Tickets

  act_as_ticketable

  #
  # Attributtes accesors
  #
  attr_accessible :state_id, :number, :location, :address, :references, :section, :district, :active, :district_head, :nominal_list, :kind, :result_images_attributes, :result_attributes

  #
  # Relations
  #
  belongs_to :state
  has_one :result
  has_many :result_images
  has_many :external_urls

  #
  # Nested attributes
  #
  accepts_nested_attributes_for :result
  accepts_nested_attributes_for :result_images

  #
  # Delegates
  #
  delegate :name, to: :state, prefix: true

  #
  # Scopes
  #
  default_scope order('boxes.id asc')

  #
  # Constants
  #
  FORMAT_DEFAULT_OPTIONS = {include: [:result, :result_images]}
  NO_EDITABLE_FIELDS = [:state_id, :number, :location, :address, :references, :section, :district, :active, :district_head, :nominal_list, :kind]

  #
  # Simple audit
  #
  simple_audit username_method: :email do |box|
    {
      state_id: box.state_id,
      number: box.number,
      location: box.location,
      address: box.address,
      references: box.references,
      section: box.section,
      district: box.district,
      district_head: box.district_head,
      nominal_list: box.nominal_list,
      kind: box.kind,
      result_images: box.result_images.map(&:image)
    }
  end

  def self.search(params)
    klass = self
    params.each do |param|
      klass = klass.where(param.first.to_s => param.last) if column_names.include? param.first.to_s
      if param.first.to_s == 'state'
        klass = klass.includes(:state)
        klass = klass.where(["state = ? and variants @@ ?", param.last.capitalize, param.last.capitalize])
      end
    end
    klass
  end

  def self.missing_image_by_state(state)
    self.joins('LEFT JOIN result_images rs ON boxes.id = rs.box_id').includes(:state).where('states.name = ?',state)
  end

  def as_json(options = {})
    options.merge!(FORMAT_DEFAULT_OPTIONS)
    super(options)
  end

  def to_xml(options = {}, &block)
    options.merge!(FORMAT_DEFAULT_OPTIONS)
    super(options, &block)
  end

  def self.by_state_and_section state_id, section
    where state_id: state_id, section: section
  end

  def self.special_by_state state_id
    where state_id: state_id, kind: 'Especial'
  end

  def self.find_boxes state_id, section
    (section == 'especiales') ? special_by_state(state_id) : by_state_and_section(state_id, section)
  end

  def self.to_verified
    includes(:result).where('results.state = ?','ready_to_revision').order('results.created_at ASC')
  end

  def has_results?
    self.result.present? && (self.result.new? || self.result.ready_to_revision?)
  end

  def verified?
    result.try(:verified?)
  end



end
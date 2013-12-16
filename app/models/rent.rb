class Rent
  include Mongoid::Document
  include Mongoid::Timestamps::Created::Short

  # attr_writer :vehicles

  belongs_to :client
  embeds_one :down_payment
  has_many :uses

  field :start_date, type: Date, default: -> { Date.today }
  field :paid_at, type: Date

  accepts_nested_attributes_for :uses,
    reject_if: ->(attributes) { attributes[:vehicle_attributes][:id].blank? }
    
  def vehicles
    Vehicle.in(id: uses.map(&:vehicle_id))
  end

  # def uses_attributes=(uses_attributes)
  #   uses_attributes.delete_if {|k,v| v[:vehicle_attributes][:id].blank? }
    
  #   uses_attributes.each do |uses_attribute|
  #     byebug
  #     uses_attribute.each {|}
  #     uses << attributes
  # ou uses.new attributes
  #   end

  # end

end

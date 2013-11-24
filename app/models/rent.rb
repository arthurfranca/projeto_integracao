class Rent
  include Mongoid::Document
  include Mongoid::Timestamps::Created::Short

  belongs_to :client
  embeds_one :down_payment
  has_many :uses

  field :start_date, type: Date, default: -> { Date.today }
  field :paid_at, type: Date

  def vehicles
    Vehicle.in(id: uses.map(&:vehicle_id))
  end
end

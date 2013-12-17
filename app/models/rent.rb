class Rent
  include Mongoid::Document
  include Mongoid::Timestamps::Created::Short

  # after_create { assign_role }
  after_create :handle_vehicles
  
  belongs_to :client
  embeds_one :down_payment
  has_many :uses

  # delete from params uses with no vehicles
  accepts_nested_attributes_for :uses,
    reject_if: ->(use) { use[:vehicle_id].blank? unless use[:_destroy] }

  field :start_date, type: Date, default: -> { Date.today }
  field :paid_at, type: Date
    
  def vehicles
    Vehicle.in(id: uses.map(&:vehicle_id))
  end

  private

  def handle_vehicles
    base_value_sum = 0.0
    uses.each do |u|
      v = u.vehicle
      # assign rented status to vehicle
      v.update_attribute(:status, "rented")
      # store base_value of vehicle at the moment the rent has taken place
      u.update_attribute(:base_value, v.base_value)
      base_value_sum += v.base_value
    end

    # set down_payment value
    down_payment = DownPayment.new(value: base_value_sum)
    update_attribute(:down_payment, down_payment)
  end
end

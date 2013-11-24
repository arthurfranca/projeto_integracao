class Manufacturer
  include Mongoid::Document

  has_many :models

  field :name, type: String

  def vehicles
    Vehicle.in(id: models.map(&:vehicle_id))
  end
end

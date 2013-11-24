class Vehicle
  include Mongoid::Document

  belongs_to :model
  has_many :uses

  field :year, type: Integer
  field :plate, type: String
  field :base_value, type: Float
  field :status, type: String, default: "available"

  def rents
    Rent.in(id: uses.map(&:rent_id))
  end
end

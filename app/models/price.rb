class Price
  include Mongoid::Document

  field :per_km, type: Float
  field :percentage, type: Float
end

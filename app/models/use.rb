class Use
  include Mongoid::Document

  belongs_to :rent
  belongs_to :vehicle

  field :km, type: Float
  field :base_value, type: Float
  field :return_date, type: Date
  field :is_paid, type: Boolean, default: false
end

class DownPayment
  include Mongoid::Document

  embedded_in :rent

  field :value, type: Float
  field :is_paid, type: Boolean, default: false
end

class Model
  include Mongoid::Document

  belongs_to :manufacturer
  has_many :vehicles

  accepts_nested_attributes_for :manufacturer

  field :name, type: String
end

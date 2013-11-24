class Model
  include Mongoid::Document

  belongs_to :manufacturer
  has_many :vehicles

  field :name, type: String
end

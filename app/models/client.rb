class Client
  include Mongoid::Document

  has_many :rents

  field :cpf, type: String
  field :name, type: String
  field :email, type: String
  field :phone, type: String
  field :address, type: String
end

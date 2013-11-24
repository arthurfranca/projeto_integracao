class Admin
  include Mongoid::Document

  field :registry, type: String
  field :password, type: String
end

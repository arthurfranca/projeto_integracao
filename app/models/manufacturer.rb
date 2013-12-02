class Manufacturer
  include Mongoid::Document

  has_many :models

  field :name, type: String

  def vehicles
    Vehicle.in(id: models.map(&:vehicle_id))
  end

  def user_roads
    Road.from_client_id(current_user.client_id)
  end

  def user_roadways_with_road_id
    user_roads.joins(:roadways).select("roads.id as road_id, roadways.id, roadways.name").order("roadways.name")
  end

  def self.possible_models manufacturers
    possible_models = []
    manufacturers.each do |manufacturer|
      manufacturer.models.each do |model|
        possible_models << { id: model.id.to_s, name: model.name, manufacturer_id: manufacturer.id.to_s }
      end
    end

    possible_models.sort_by { |valor| valor[:name] }
  end
end

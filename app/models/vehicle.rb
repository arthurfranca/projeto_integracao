class Vehicle
  include Mongoid::Document

  belongs_to :model
  has_many :uses

  accepts_nested_attributes_for :model

  field :year, type: Integer
  field :plate, type: String
  field :base_value, type: Float
  field :status, type: String, default: "available"

  EDITABLE_STATUS = [ "available", "fixing" ]

  def rents
    Rent.in(id: uses.map(&:rent_id))
  end

  def status(raw = true)
    raw ? read_attribute(:status) : serialize_status(read_attribute(:status))
  end

  private
    def serialize_status status
      case status
        when "available"
          add_color status, "success"
        when "fixing"
          add_color status, "warning"
        when "rented"
          add_color status, "danger"
        else
          add_color "no_info", "default"
      end
    end

    def add_color status, klass
      "<span class='#{klass}'><strong>#{I18n.t(status).capitalize}</strong></span>".html_safe
    end
end

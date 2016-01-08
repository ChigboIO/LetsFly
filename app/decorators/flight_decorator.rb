class FlightDecorator
  attr_reader :component

  def initialize(component)
    @component = component
  end

  def departure_d
    d_date = DateTime.parse(component.departure_datetime.to_s)
    d_date.strftime("%A, #{d_date.day.ordinalize} %b %Y")
  end

  def departure_t
    d_date = DateTime.parse(component.departure_datetime.to_s)
    d_date.strftime("%l:%M %P")
  end

  def arrival_d
    d_date = Date.parse(component.arrival_datetime.to_s)
    d_date.strftime("%A, #{d_date.day.ordinalize} %b %Y")
  end

  def arrival_t
    d_date = Time.parse(component.arrival_datetime.to_s)
    d_date.strftime("%l:%M %P")
  end

  def method_missing(method_name, *args, &block)
    component.send(method_name, *args, &block)
  end

  def respond_to_missing?(method_name, include_all = false)
    component.respond_to?(method_name, include_all) || super
  end
end

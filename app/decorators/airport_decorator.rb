class AirportDecorator
  attr_reader :component

  def initialize(component)
    @component = component
  end

  def name_with_state
    component.name + ", " + component.state
  end

  def method_missing(method_name, *args, &block)
    component.send(method_name, *args, &block)
  end

  def respond_to_missing?(method_name, include_all = false)
    component.respond_to?(method_name, include_all) || super
  end
end

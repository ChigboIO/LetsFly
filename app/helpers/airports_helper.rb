module AirportsHelper
  def list_airports
    Airport.all.map { |a| [a.decorate.name_with_state, a.id] }
  end
end

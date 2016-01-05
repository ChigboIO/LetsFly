module BookingsHelper
  def paypal_url(booking, return_url)
    values = {
      business: "chigboemmanuel-facilitator@gmail.com",
      cmd: "_cart",
      upload: 1,
      return: return_url,
      invoice: booking.id + rand(100_000..999_999)
    }

    booking.passengers.each_with_index do |item, index|
      values.merge!(
        "amount_#{index + 1}" => booking.flight.price,
        "item_name_#{index + 1}" => item.name
      )
    end
    "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
  end
end

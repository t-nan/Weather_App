
class GetWeather #28143

  attr_accessor :city_key

  def initialize(city_key)
    @city_key = city_key
  end

  def current_weather
    uri = URI("http://dataservice.accuweather.com/currentconditions/v1/#{city_key}")

    params = { apikey: 'D819qs416v8fq7lv1yY6HSvFYk4DbQ9K'}
    uri.query = URI.encode_www_form(params)

    res = Net::HTTP.get_response(uri)

    JSON.parse(res.body) if res.is_a?(Net::HTTPSuccess)
  end

  def historical_weather
    uri = URI("http://dataservice.accuweather.com/currentconditions/v1/#{city_key}/historical/24")

    params = { apikey: 'D819qs416v8fq7lv1yY6HSvFYk4DbQ9K'}
    uri.query = URI.encode_www_form(params)

    res = Net::HTTP.get_response(uri)

    JSON.parse(res.body) if res.is_a?(Net::HTTPSuccess)
  end
  
end
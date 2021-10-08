
class StoreWeatherData

  attr_accessor :city_key, :weather_data_array

  def initialize(city_key, weather_data_array)
    @city_key = city_key
    @weather_data_array = weather_data_array
  end

  def call
    city = City.find_by(city_key: city_key)

    weather_data_array.each do |data|

      city.weathers.create(
        local_observation_date_time: data[:local_observation_date_time],
        temperature_value: data[:temperature]
      )
    end

  end

end
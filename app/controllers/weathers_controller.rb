class WeathersController < ApplicationController

  before_action :find_city

  def current   
    response = GetWeather.new(@city.city_key).current_weather
    @ww = WeatherFormat.new(response).formatt  
    StoreWeatherData.new(28143,@ww).call
  end

  def historical
    byebug
    response = GetWeather.new(@city.city_key).historical_weather
    @ww = WeatherFormat.new(response).formatt
    StoreWeatherData.new(28143,@ww).call
  end

  def max
    response = GetWeather.new(@city.city_key).historical_weather
    temperature = WeatherFormat.new(response).formatt
    @ww = MaxTemperature.new(temperature).maximum
  end

  def min
    response = GetWeather.new(@city.city_key).historical_weather
    temperature = WeatherFormat.new(response).formatt
    @ww = MinTemperature.new(temperature).minimum
  end

  def avg
    response = GetWeather.new(@city.city_key).historical_weather
    temperature = WeatherFormat.new(response).formatt
    @ww = AvgTemperature.new(temperature).average
  end

  def by_time
    @ww=GetByTime.new(28143,1621823790).by_time
  end

  private

  def find_city
    @city = City.find_or_create_by(city_key: 28143, name: "Test city")
  end

end

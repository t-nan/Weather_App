require 'rails_helper'

RSpec.describe StoreWeatherData, type: :service do
  let(:weather_data) do
    [
      {
        :local_observation_date_time=>"2021-10-08T01:56:00+06:00",
        :temperature=>27.8
      },
      {
        :local_observation_date_time=>"2021-10-08T01:02:00+06:00",
        :temperature=>30.0
      }
    ]
  end

  let(:city) { City.create(name:"Test",
    city_key: "28143") }


  it 'saves weather data' do
    expect {
      StoreWeatherData.new(city.city_key,
        weather_data).call
    }.to change(Weather, :count).by 2
      weather = Weather.last
      expect(weather.temperature_value).to eq 30.0
  end
end
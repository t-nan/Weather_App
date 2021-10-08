require 'rails_helper'

RSpec.describe GetByTime, type: :service do
  let!(:weather_1) do
    city.weathers.create(
      local_observation_date_time:"2021-10-01T01:56:00+06:00",
      temperature_value: "21"
    )
  end
  let!(:weather_2) do
    city.weathers.create(
      local_observation_date_time:"2021-10-08T01:56:00+06:00",
      temperature_value: "42"
    )
  end

  let(:city) { City.create(name:"Test", city_key: "28143") }


  it 'saves weather data' do
    result = GetByTime.new(city.city_key,Time.now.to_i).by_time
    expect(result.id).to eq weather_2.id
  end
end
require 'rails_helper'

RSpec.describe MaxTemperature, type: :service do
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


  it 'returns max weather data' do
    result = MaxTemperature.new(weather_data).maximum
    expect(result).to eq 30.0
  end
end
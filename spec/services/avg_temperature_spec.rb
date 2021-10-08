require 'rails_helper'

RSpec.describe AvgTemperature, type: :service do
  let(:weather_data) do
    [
      {
        :local_observation_date_time=>"2021-10-08T01:56:00+06:00",
        :temperature=>20
      },
      {
        :local_observation_date_time=>"2021-10-08T01:02:00+06:00",
        :temperature=>30
      }
    ]
  end


  it 'returns average weather data' do
    result = AvgTemperature.new(weather_data).average
    expect(result).to eq 25
  end
end
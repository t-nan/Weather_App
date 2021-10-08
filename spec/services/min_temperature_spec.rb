require 'rails_helper'

RSpec.describe MinTemperature, type: :service do
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


  it 'returns min weather data' do
    result = MinTemperature.new(weather_data).minimum
    expect(result).to eq 20
  end
end
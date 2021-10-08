require 'rails_helper'

RSpec.describe WeatherFormat, type: :service do

  let(:weather_raw_data) do

    [{"LocalObservationDateTime"=>"2021-10-08T05:35:00+06:00",
      "EpochTime"=>1633649700, "WeatherText"=>"Partly cloudy", 
      "WeatherIcon"=>35, "HasPrecipitation"=>false,
      "PrecipitationType"=>nil, "IsDayTime"=>false,
      "Temperature"=>{"Metric"=>{"Value"=>27.2, "Unit"=>"C", "UnitType"=>17},
      "Imperial"=>{"Value"=>81.0, "Unit"=>"F", "UnitType"=>18}},
      "MobileLink"=>"http://www.accuweather.com/en/bd/dhaka/28143/current-weather/28143?lang=en-us",
      "Link"=>"http://www.accuweather.com/en/bd/dhaka/28143/current-weather/28143?lang=en-us"}]
  end

  let(:expected_array) do
	  [{:local_observation_date_time=>"2021-10-08T05:35:00+06:00", :temperature=>27.2}] 
  end


  it 'should format data' do
    result=WeatherFormat.new(weather_raw_data).formatt
      
    expect(result).to eq (expected_array)
  end

end

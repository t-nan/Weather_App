class WeatherFormat

  attr_accessor :weather_data

  def initialize (weather_data)
    @weather_data=weather_data
  end

  def formatt
    arr=[]
    weather_data.each do |i|
      hh={}
      hh[:local_observation_date_time]=i["LocalObservationDateTime"]
      hh[:temperature]=i["Temperature"]["Metric"]["Value"]
      arr<<hh
    end
    arr
  end
end
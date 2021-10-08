
class GetByTime
  attr_accessor :data_by_time, :city_key


  def initialize(city_key,data_by_time)
    @data_by_time = data_by_time 
    @city_key = city_key
  end

  def by_time
    city = City.find_or_create_by(city_key: city_key)
    time=Time.at(data_by_time)

    city.weathers.order("ABS(julianday(local_observation_date_time)-julianday('#{time.utc.strftime('%Y-%m-%d %H:%M:%S')}'))").first
  end

end


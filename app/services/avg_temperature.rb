
class AvgTemperature

  attr_accessor :weather_data

  def initialize(weather_data)
    @weather_data = weather_data  
  end

  def average
    @temp_all=[]

    @weather_data.each do |data|
      @temp_all << data[:temperature]
    end
    @avg_temp=@temp_all.sum / @temp_all.size
    @avg_temp.round(2)
  end

end
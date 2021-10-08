
class MaxTemperature

  attr_accessor :weather_data

  def initialize(weather_data)
    @weather_data = weather_data  
  end

  def maximum
    @temp_all=[]

    @weather_data.each do |data|
      @temp_all << data[:temperature]
    end
    @temp_all.max
  end

end
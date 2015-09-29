class Alarm
  
  def initialize(sensor)
  	@sensor = sensor
  	@on = false
  end

  def check
  	pressure = @sensor.sample_pressure
  	if pressure < 17.5 || pressure > 21
  		@on = true
  	end
  end

  def on?
  	@on
  end
end

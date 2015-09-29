class Alarm
  
  def initialize(sensor, notifier)
  	@sensor = sensor
  	@on = false
    @notifier = notifier
  end

  def check
  	pressure = @sensor.sample_pressure
  	if pressure < 17.5 || pressure > 21
      @notifier.out_of_bounds
      @on = true
  	end
  end

  def on?
  	@on
  end
end

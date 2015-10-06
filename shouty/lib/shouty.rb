class Person
	attr_reader :position
  def initialize(network, position)
    @network = network
    @network.subscribe(self)
    @messages_heard = []
    @position = position
  end

  def move_to(location)
  end

  def shout(message)
    @network.broadcast(message, @position)
    self
  end

  def hear(message)
  	 @messages_heard << message #if (position - @position).abs <= 50
  end

  def messages_heard
    @messages_heard
  end
end

class Network
	MAX_RANGE = 50
  def initialize
    @subscribers = []
  end

  def subscribe(subscriber)
    @subscribers << subscriber
    self
  end

  def broadcast(message, position)
    @subscribers.each do |subscriber|
     	subscriber.hear(message) if (position - subscriber.position).abs <= 50
 	end
  end


end



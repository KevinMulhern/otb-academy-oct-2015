require 'shouty'

describe Person do
  let(:network) { double.as_null_object }
  it "subscribe to the network when created" do
    expect(network).to receive(:subscribe).with(an_instance_of(Person))
    Person.new(network, 0)
  end

  it "broadasts shouts using the network" do
    sean = Person.new(network, 0)
    message = "Free Bagels!"

    expect(network).to receive(:broadcast).with(message, 0)

    sean.shout(message)
  end

  it "records messages heard" do
    lucy = Person.new(network, 0)
    message = "Free Bagels!"
    lucy.hear(message)

    expect(lucy.messages_heard).to include(message)
  end

  # it "does not receive messages when out of range of other person" do
  # 	lucy = Person.new(network,15)
  # 	message = "Free Bagels!"

  # 	expect(lucy.messages_heard).not_to include(message, 70)

  # 	network.broadcast(message, )

  # end
end

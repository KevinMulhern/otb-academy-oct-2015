require 'shouty'
RSpec.describe Network do
  it "broadcast messages to all subscribers within range" do
    network = Network.new

    lucy = double("lucy", { position: 15})
    pam = double("pam", { position: 50} )

    network.subscribe(lucy)
    network.subscribe(pam)

    message = "Free Toast!"

    expect(lucy).to receive(:hear).with(message)
    expect(pam).to receive(:hear).with(message)

    network.broadcast(message, 0)
  end
  it "does not broadcast messages to people who are out of range" do
    network = Network.new

    lucy = double("lucy", { position: 10})

    network.subscribe(lucy)

    message = "Free Toast!"

    expect(lucy).not_to receive(:hear).with(message)

    network.broadcast(message, 70)
  end
end


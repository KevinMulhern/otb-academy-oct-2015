require 'alarm'
require 'sensor'
RSpec.describe "tyre pressure alarm" do
	subject { Alarm.new(sensor) }
	let(:sensor) { double("sensor", :sample_pressure => 17.5) }

	before do
		subject.check
	end
	
  it "initialize's alarm class with sensor value" do
  	subject
  end

  it "makes sure sensor can call sample pressure" do
  	expect( sensor ).to receive(:sample_pressure)
  	subject.check
  end

  context "low tyre pressure" do
  	let(:sensor) { double("sensor", :sample_pressure => 17) }

  	it "checks low tyre pressure" do 
  		expect( subject.on? ).to eq(true)
  	end
  end

  context "high tyre pressure" do
    let(:sensor) { double("sensor", :sample_pressure => 22) }

    it "checks high tyre pressure" do
      expect( subject.on? ).to eq(true)
    end
  end

  context "tyre pressure within range" do
    let(:sensor) { double("sensor", :sample_pressure => 18) }

    it "checks false response for alarm when pressure in range" do 
      expect( subject.on?).to eq(false)
    end
  end


end

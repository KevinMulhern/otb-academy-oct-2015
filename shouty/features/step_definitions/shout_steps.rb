require 'shouty'

Given(/^Lucy is (\d+)m from Sean$/) do |distance|
  @network = Network.new
  @lucy = Person.new(@network, 50)
  @sean = Person.new(@network, 10)
  @lucy.move_to(distance)
end

When(/^Sean shouts "([^"]*)"$/) do |message|
  @seans_message = message
  @sean.shout(message)
end

Then(/^Lucy hears Sean's message$/) do
  expect(@lucy.messages_heard).to include(@seans_message)
end

 Then(/^Lucy does not hear Sean's message$/) do
 	lucy = Person.new(@network, 70)
    sean = Person.new(@network, 10)
 	expect(lucy.messages_heard).not_to include(@seans_message)
end


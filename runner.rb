require './lib/attendees'
require './lib/clean'
require './lib/queue'

q = Queue.new
attendees = Attendees.new

puts "Welcome to Event Reporter"
quit = false
until quit do
  puts "What would you like to do?>>"
  answer = gets.chomp.split
  case answer[0]
  when "help"
    #check for more arguments (answer.length)
    #list commands if answer.length = 1
    #give out specific info if length = 2, based on the second bit
    #should handle 10 things:
    # help
    # help load
    # help queue count
    # help queue clear
    # help queue district
    # help queue print
    # help queue save to
    # help queue export html
    # help find
    # help help

  when "queue"
    #check the next argument and do the shit based on that
    #should handle 6 things:

  when "load"
    #check for filename or call load to default to event_attendees
    #should handle 1 thing
  when "find"
    #call the find method with [1] and [2] as arugments
  when 'quit'
    quit = true
  else
  end
end

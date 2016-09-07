require './lib/attendees'
require './lib/clean'
require './lib/queue'
require './lib/phrase'
q = Queue.new
attendees = Attendees.new
phrase = Phrase.new

lines = "--------------------------------------------------------"

puts "****************************************************"
puts "Welcome to Event Reporter"
puts lines
quit = false
until quit do
  puts lines
  puts "What would you like to do?"
  puts lines
  answer = gets.chomp.split
  case answer[0]
  when "help"
    if answer.length == 1
      phrase.help
    elsif answer.length == 2 && answer[1] == "load"
      phrase.load
    elsif answer.length == 2 && answer[1] == "save"
      phrase.save
    elsif answer.length == 2 && answer[1] == "export"
      phrase.export
    elsif answer.length == 2 && answer[1] == "find"
      phrase.find
    elsif answer.length == 2 && answer[1] == "help"
      phrase.help_help
    elsif answer.length == 3 && answer[1] == "queue"
      if answer[2] == "count"
        phrase.queue_count
      elsif answer[2] == "clear"
        phrase.queue_clear
      elsif answer[2] == "district"
        phrase.queue_district
      else answer[2] == "print"
        phrase.queue_print
      end
    end
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

require './lib/attendees'
require './lib/attendee'
require './lib/clean'
require './lib/que'
require './lib/phrase'
require './lib/print'
require './lib/district'

attendees = Attendees.new
attendees.load
phrase = Phrase.new
output = Print.new

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
    if answer.length == 2
      case answer[1]
      when "count"
        puts attendees.q.count

      when "clear"
        attendees.q.clear
      when "district"
        attendees.find_district
      when "print"
        output.headers
      end
    elsif answer.length == 3
      if answer[2] == "by"
        puts "print by attribute coming soon"
      elsif answer[1] == "save"
        puts "saving coming soon"
      elsif answer[1] == "export"
        puts "export coming soon"
      end
    end


  when "load"
    if answer.length == 1
      attendees.load
    else
      attendess.load(answer[1])
    end


  when "find"
    attendees.find(answer[1], answer[2])#call the find method with [1] and [2] as arugments
  when 'quit'
    quit = true
  else
  end
end

require './lib/attendees.rb'
require './lib/phrase.rb'

class Repl
  attr_reader :run, :argv, :command
  def initialize
    @argv = ""
    @command = ""
    @attribute = ""
    @criteria1 = ""
    @criteria2 = ""
    @criteria3 = ""
  end

  def run
    puts "Welcome to Event Reporter"
    lines = '------------------------------------------'
    argv = ''
    until argv == "quit"
      puts lines
      puts "What would you like to do?"
      puts lines
      argv = gets.chomp
      assign_answer(argv)
      delegate
    end
  end

  def assign_answer(argv)
    @argv = argv.split
    command = argv[0]
    attribute = argv[1]
    criteria1 = argv[2]
    criteria2 = argv[3]
  end

  def delegate
    case command
    when "load"
      load
    when "help"
      help
    when "queue"
      queue
    when "find"
      find
    when "quit"
      quit
    end
  end

  def load
    attendees = Attendees.new
    if argv.length == 1
      attendees.load
    else
      attendees.load(attribute)
    end
  end

  def queue
    if argv.length == 2
      queue_simple
    elsif argv.length == 3
      queue_compound
    end
  end

  def queue_simple
    case attribute
    when "count"
      puts attendees.q.count
    when "clear"
      attendees.q.clear
    when "district"
      attendees.find_district
    when "print"
      output.headers #doesn't work yet
    end
  end

  def queue_compound

  end
  # elsif answer.length == 3
  #   if answer[2] == "by"
  #     puts "print by attribute coming soon"
  #   elsif answer[1] == "save"
  #     puts "saving coming soon"
  #   elsif answer[1] == "export"
  #     puts "export coming soon"
  #   end
  # end
end
repl = Repl.new
repl.run
require "pry"; binding.pry

require './lib/attendees.rb'
require './lib/phrase.rb'

class Repl
  include Phrase
  attr_reader :run, :argv, :command, :attendees, :command, :attribute, :criteria1, :criteria2, :criteria3
  def initialize
    @attendees = Attendees.new
    @argv = ""
    @command = ""
    @attribute = ""
    @criteria1 = ""
    @criteria2 = ""
    @criteria3 = ""
  end

  def run
    puts "Welcome to Event Reporter"
    lines = "------------------------------------------"
    input = ''
    until input == "quit"
      puts lines
      puts "What would you like to do?"
      puts lines
      input = gets.chomp
      assign_answer(input)
      delegate
    end
  end

  def assign_answer(input)
    @argv = input.split
    @command = argv[0]
    @attribute = argv[1]
    @criteria1 = argv[2]
    @criteria2 = argv[3]
    @criteria3 = argv[4]
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
    when "check"
      check
    end
  end

  def check
    require "pry"; binding.pry
  end

  def load
    if argv.length == 1
      attendees.load
    else
      attendees.load(attribute)
    end
  end

  def queue
    if argv.length == 2
      queue_simple
    elsif argv.length >= 3
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
      attendees.print
    end
  end

  def queue_compound
    if attribute == "export"
      attendees.output_html(criteria2)
    elsif attribute == "save"
      attendees.output_csv(criteria2)
    elsif attribute == "print"
      attendees.print_by(criteria3)
    end
  end

  def find
    if attribute == 'first' || attribute == 'last'
      attendees.find(format_name, criteria2)
    elsif attribute == 'city'
      attendees.find(attribute, format_city)
    else
      attendees.find(attribute, criteria1)
    end
  end

  def format_name
    require "pry"; binding.pry
    formatted = [attribute, criteria1].join('_')
  end

  def format_city
    formatted = argv[2..-1].join(' ')
  end

  def help
    case argv.length
    when 1
      simple_help
    when 2
      double_help
    else
      queue_help
    end
  end

  def simple_help
    Phrase.help
  end

  def double_help
    case attribute
    when "help"
      Phrase.help_help
    when "load"
      Phrase.load
    when "find"
      Phrase.district
    end
  end

  def queue_help
    case criteria1
    when "count"
      Phrase.count
    when "clear"
      Phrase.clear
    when "district"
      Phrase.district
    when "print"
      print_help
    when "save"
      Phrase.save
    when "export"
      Phrase.export
    end
  end

  def print_help
    argv.length == 4 ? Phrase.print_by : Phrase.print
  end

end
repl = Repl.new
repl.run

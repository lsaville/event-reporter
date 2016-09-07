class Phrase
  attr_reader :help, :load, :queue_count, :queue_clear, :queue_district, :queue_print, :save, :export, :find, :help
  def help
    puts "here are your choices:\nhelp\nload\nqueue count\nqueue clear\nqueue district\nqueue print\nqueue save to\nqueue export\nfind"
  end

  def load
    puts "loads the program with data so you can search it"
  end

  def queue_count
    puts "displays the number of items in the queue"
  end

  def queue_clear
    puts "clears the current queue"
  end

  def queue_district
    puts "if there are less than 10 items in the queue, will fetch district data for those items"
  end

  def queue_print
    puts "prints the contents of the queue to the screen"
  end

  def save
    puts "save the contents of the queue to your_file_name.csv, filename required as option"
  end

  def export
    puts "export the contents of the queue to an html file"
  end

  def find
    puts "find works to populate the queue by searching through the data by attribute and criteria"
  end

  def help_help
    puts "you've already found it!"
  end
end

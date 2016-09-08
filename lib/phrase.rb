module Phrase
  def self.help
    puts "here are your choices:\nhelp\nload\nqueue count\nqueue clear\nqueue district\nqueue print\nqueue save to\nqueue export\nfind"
  end

  def self.load
    puts "loads the program with data so you can search it"
  end

  def self.queue_count
    puts "displays the number of items in the queue"
  end

  def self.queue_clear
    puts "clears the current queue"
  end

  def self.queue_district
    puts "if there are less than 10 items in the queue, will fetch district data for those items"
  end

  def self.queue_print
    puts "prints the contents of the queue to the screen"
  end

  def self.save
    puts "save the contents of the queue to your_file_name.csv, filename required as option"
  end

  def self.export
    puts "export the contents of the queue to an html file"
  end

  def self.find
    puts "find works to populate the queue by searching through the data by attribute and criteria"
  end

  def self.help_help
    puts "you've already found it!"
  end
end

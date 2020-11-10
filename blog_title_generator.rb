# frozen_string_literal: false

class BlogTitleGenerator
  def initialize(topic, qty)
    @topic = topic
    @qty = qty.to_i
  end

  def create_titles
    titles = all_titles.sample(@qty)

    titles.each { |title| puts title.gsub!('{topic}', @topic) }
  end

  def all_titles
    [
      '5 ways to become the BEST at {topic}',
      "12 {topic} Facts You Won't Believe!",
      '7 AMAZING tips to improve your {topic} skills',
      '8 life hacks that can make you a {topic} expert',
      '{topic} - The Ultimate Guide for Beginners'
    ]
  end
end

# pass in a noun
puts 'Please enter your topic'
topic = gets.chomp

puts 'How many titles would you like?'
qty = gets.chomp

generator = BlogTitleGenerator.new(topic, qty)
generator.create_titles

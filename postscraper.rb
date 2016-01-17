require 'nokogiri'
require 'open-uri'
require_relative 'errors'

module PostScraper 

  # POST_URL = "/vagrant/scraper-exercise/post.html"
  # LIVE_URL = "https://news.ycombinator.com/item?id=10650278"
  LIVE_URL = ARGV[0]
  raise NoLinkError, "There was no link input" if ARGV[0].nil?
 
    def self.get_title
      doc = Nokogiri::HTML(open(LIVE_URL))
      title = doc.css("title").map { |element| element.content }
      title.to_s.colorize(:light_blue)
    end 

    def self.get_url
      doc = Nokogiri::HTML(open(LIVE_URL))
      url = doc.css(".title > a").map { |element| element['href'] }
      url.to_s.colorize(:red).underline
    end 

    def self.get_points
      doc = Nokogiri::HTML(open(LIVE_URL))
      points = doc.css(".score").map { |element| element.content }.to_s.match(/\d+/)
      points.to_s.colorize(:green)
    end 

    def self.get_item_id
      doc = Nokogiri::HTML(open(LIVE_URL))
      doc.css(".subtext > .score").map { |element| element['id'] }.to_s.match(/\d+/)
    end 

    def self.get_no_of_comments
      doc = Nokogiri::HTML(open(LIVE_URL))
      comments = doc.css(".subtext :nth-child(6)").map { |element| element.content }.to_s.match(/\d+/)
      comments.to_s.colorize(:yellow)
    end 

    def self.get_op 
      doc = Nokogiri::HTML(open(LIVE_URL))
      op = doc.css(".subtext :nth-child(2)").map { |element| element.content }
      op.to_s.colorize(:light_yellow)
    end

end


# puts PostScraper.get_title
# puts PostScraper.get_url
# puts PostScraper.get_points
# puts PostScraper.get_item_id
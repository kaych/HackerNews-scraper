require 'nokogiri'
require_relative 'errors'

module CommentScraper

  # POST_URL = "/vagrant/scraper-exercise/post.html"
  # doc = Nokogiri::HTML(open(POST_URL))

  # LIVE_URL = "https://news.ycombinator.com/item?id=10650278"
  LIVE_URL = ARGV[0]
  raise NoLinkError, "There was no link input" if ARGV[0].nil?

  def self.get_authors
    doc = Nokogiri::HTML(open(LIVE_URL))
    doc.css(".comment-tree span.comhead > a").map {|element| element.content }
  end

  def self.get_ages
    doc = Nokogiri::HTML(open(LIVE_URL))
    doc.css(".comment-tree span.comhead > span.age > a").map { |element| element.content }
  end 

  def self.get_contents
    doc = Nokogiri::HTML(open(LIVE_URL))
    contents = doc.css(".comment-tree span.comment").map { |element| element.content }
    contents.each do |space|
      space.gsub!(/-----/, "").strip!
    end
    contents
  end

  def self.get_comments
    authors = get_authors
    ages = get_ages
    contents = get_contents

    authors.zip(ages, contents)
  end

end


# puts CommentScraper.all_together
# puts CommentScraper.get_authors.is_a? Array
# puts CommentScraper.get_ages.is_a? Array
# puts CommentScraper.get_contents.is_a? Array
# puts CommentScraper.get_comments.is_a? Array 
# c << ["Kay", "12 days ago", "yoyoyo"]
# puts c

# binding.pry
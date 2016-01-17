# require 'pry'
require 'open-uri'
require 'nokogiri'
require 'colorize'
require_relative 'comment'
require_relative 'post'
require_relative 'commentscraper' 
require_relative 'postscraper'
require_relative 'errors'


# title = PostScraper.get_title
# url = PostScraper.get_url
# points = PostScraper.get_points
# item_id = PostScraper.get_item_id
# old_comments = CommentScraper.get_comments

# article = Post.new(title, url, points, item_id, old_comments)
# # article.comments

# # Driver code

# new_comment = Comment.new("Kay", "12 days ago", "This is a comment!")
# new_array = new_comment.into_array

# article.add_comments(new_array) ## ADDS
# puts article.comments ## RETURNS ARRAY 

# puts old_comments[19] ## GOOD


def hacker_post_info
  STDOUT.puts "Post title: ".colorize(:light_blue)
  STDOUT.puts PostScraper.get_title
  STDOUT.puts "Original URL: ".colorize(:red)
  STDOUT.puts PostScraper.get_url
  STDOUT.puts "Original poster: ".colorize(:light_yellow)
  STDOUT.puts PostScraper.get_op
  STDOUT.puts "Number of comments: ".colorize(:yellow)
  STDOUT.puts PostScraper.get_no_of_comments
  STDOUT.puts "Number of points: ".colorize(:green)
  STDOUT.puts PostScraper.get_points
end

hacker_post_info





class Post

  attr_accessor :title, :url, :points, :item_id, :old_comments

  def initialize(title, url, points, item_id, old_comments = nil)
    @title = title
    @url = url
    @points = points
    @item_id = item_id
    @old_comments = old_comments
  end

  def add_comments(new_comment)
    unless @old_comments.nil?
      @old_comments.push(new_comment)
    else 
      @comments_array = []
      @comments_array.push(new_comment)
    end
  end

  def comments
    unless @old_comments.nil?
      puts @old_comments
    end

    if @old_comments.nil?
      if @comments_array.nil?
        puts "There are no comments here!"
      else
        puts @comments_array
      end
    end
  end

end

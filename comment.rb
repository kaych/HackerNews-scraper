class Comment 

  attr_reader :author, :age, :content

  def initialize(author, age, content)
    @author = author
    @age = age
    @content = content
  end

  def into_array
    array = []
    array[0] = @author
    array[1] = @age
    array[2] = @content
    array
  end

end

# c = Comment.new("Kay", "12 days ago", "yoyoyoyo")
# puts c





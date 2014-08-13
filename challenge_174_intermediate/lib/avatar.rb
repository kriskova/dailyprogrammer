class Avatar
  require 'digest'
  require 'chunky_png'
  attr_accessor :name, :image, :sha


  def initialize(name)
    @name = name
    @sha = Digest::SHA1.hexdigest(@name)
    @image = generate_image()
  end

  private

  def generate_image()
    matrix = generate_matrix()
    png = ChunkyPNG::Image.new(64,64,ChunkyPNG::Color::WHITE)
    color = ChunkyPNG::Color.from_hex(@sha[32,6])
    matrix.each_with_index do |column, x|
      column.each_with_index do |row, y|
        png.rect(x*8,y*8,(x+1)*8,(y+1)*8, color, color) if matrix[x][y]
      end
    end
    png.save(File.expand_path("../../images/#{@name.downcase}_avatar.png",__FILE__))
  end

  def generate_matrix()
    matrix = []
    @sha.split("")[0,32].map { |n| n.hex >=8 ? true : false }.each_slice(8) { |a| matrix.push(a) }
    matrix += matrix.reverse
  end
end


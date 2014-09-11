require 'chunky_png'
include ChunkyPNG::Color

def greyscale_pixel(pixel)
  red = (r(pixel)*0.21).to_i
  green = (g(pixel)*0.72).to_i
  blue = (b(pixel)*0.07).to_i
  color = red + green + blue
  rgb(color,color,color)
end

input_image = ChunkyPNG::Image.from_file(ARGV.first)
output_image = ChunkyPNG::Image.new(input_image.width,input_image.height)

input_image.height.times do |y|
  input_image.row(y).each_with_index do |pixel, x|
    output_image[x,y] = greyscale_pixel(pixel)
  end
end

output_image.save(File.basename(ARGV.first,".png") + "_grayscale.png")
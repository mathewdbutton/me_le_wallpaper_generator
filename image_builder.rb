

require "chunky_png"

class ImageBuilder
  MORTALITY = rand(1..3)

  def self.generate(...)
    new(...).generate
  end

  def generate
    primary_positions = %w[1a 1b]
    secondary_positions = %w[2a 4b 3a 3c 4a 3b]
    
    background = ChunkyPNG::Image.from_file("./public/hd/morality-#{MORTALITY}.png")

    (select_positions(primary_characters, primary_positions) + 
     select_positions(secondary_characters, secondary_positions) +
     [location, "ship"] ).each do |character_position|
      background.compose!(ChunkyPNG::Image.from_file("./public/hd/#{character_position}-#{MORTALITY}.png"))
    end
    
    background.compose!(ChunkyPNG::Image.from_file("./public/hd/logo-me-le.png"))
    background.save("mass-effect-wallpaper.png", :fast_rgba)
  end

  # Find all characters with -1?- in file name e.g. -1a-
  # These are the characters that have larger portraits and sit in the top two positions
  def primary_characters
    @primary_characters ||= Dir.glob("*-1*-*.png", base: "./public/hd/").map { /^(.*?)-/.match(_1)[1] }.uniq.sample(2)
  end

  # Find renaming characters without -1?- in file name e.g. -2a-
  # These are all the characters that will go in the remaining 6 secondary positions, remove any characters that are already present in the primary positions 
  def secondary_characters
    return @secondary_characters if @secondary_characters
    character_filenames = Dir.glob("*-[2-4]*-*.png", base: "./public/hd/").map { /^(.*?)-/.match(_1)[1] }.uniq - ["location", "morality"]
    @secondary_characters ||= (character_filenames - primary_characters).sample(6)
  end

  def select_positions(selected_characters = [], positions = [])
    selected_characters.zip(positions).map { _1.join("-")}
  end

  def location
    "location-#{%w[invaded omega eden-prime collector-base citadel].sample}"
  end
end
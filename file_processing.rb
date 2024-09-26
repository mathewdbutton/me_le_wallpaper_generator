
# Rename "2" files to have a letter
# e.g. anderson-2-1.png -> anderson-2a-1.png
two_files = Dir.glob("./public/hd/*-2-*.png")
two_files.each do |file_name|
  new_name = file_name.sub("2","2a")
  puts "Changing from #{file_name} to #{new_name}"
  File.rename(file_name, new_name)
end
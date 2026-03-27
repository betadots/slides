# frozen_string_literal: true

require 'fileutils'
require 'pathname'

# The data hash keys are the FileUtils methods
# The values are an array of elements to be created by that method
data = {
  ln_s: [
    'template/static'
  ],
  cp_r: [
    'template/css',
    'template/images'
  ],
  cp: [
    'template/index.html',
    'template/favicon.ico',
    'template/slides.md'
  ],
}

# sanity checks
unless ARGV[0]
  puts 'please provide a name (used as directory)'
  exit 1
end

puts 'checking for available content'
files = data.map { |k,v| v }.flatten
file_check = true

files.each do |file|
  unless File.exist?(file)
    puts "source file #{file} does not exist."
    file_check = false
  end
end

if file_check
  puts 'check OK'
else
  exit 2
end

name = ARGV[0]

if File.exist?(name)
  puts "Directory exists"
  exit 3
else
  puts 'creating directory'
  FileUtils.mkdir_p(name)
end

puts 'check and add files to new slide - if missing'

data.each do |command, elements|
  elements.each do |element|
    link_path = "#{name}/#{element.split('/').last}"

    if command == :ln_s
      # Calculate relative path from new directory to source
      source_path     = Pathname.new(element).realpath
      link_dir        = Pathname.new(name).realpath
      relative_target = source_path.relative_path_from(link_dir)

      FileUtils.send command, relative_target.to_s, link_path.to_s
    else
      FileUtils.send command, element, link_path
    end
  end
end

puts "New slideset created at #{name}"

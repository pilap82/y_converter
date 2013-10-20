#!/usr/bin/env ruby

# y_converter.rb

require 'optparse'
require './lib/yamlator.rb'

options = {}

opt_parser = OptionParser.new do |opt|
  opt.banner = "Usage: opt_parser COMMAND [OPTIONS]"
  opt.separator  ""
  opt.separator  "Commands"
  opt.separator  "     flat: converts the YAML file to a flat format"
  opt.separator  "     nested: converts the YAML file to a nested format"
  opt.separator  ""
  opt.separator  "Options"

  opt.on("-f","--file FILE_PATH","path of the file you want to convert") do |file_path|
    options[:f] = file_path
  end

  opt.on("-h","--help","help") do
    puts opt_parser
  end
end

opt_parser.parse!

def target_file_name(file_path)
  # <original name>.<command>.<original extension>
  f = file_path
  target_name = File.basename(f, ".yml")

  target_name.gsub!(".nested", "") if ARGV[0] == "flat"
  target_name.gsub!(".flat", "") if ARGV[0] == "nested"
  "#{File.dirname(f)}/#{target_name}.#{ARGV[0]}.yml"
end


case ARGV[0]
when "flat"
  STDOUT.puts "Outputs YAML in flat format"
  y = YAMLator.new(File.read(options[:f]))

  File.write(target_file_name(options[:f]), y.to_flat_yaml)
when "nested"
  STDOUT.puts "Outputs YAML in nested format with option #{options.inspect}"
  y = YAMLator.new(File.read(options[:f]))
  File.write(target_file_name(options[:f]), y.to_nested_yaml)
else
  STDOUT.puts opt_parser
end

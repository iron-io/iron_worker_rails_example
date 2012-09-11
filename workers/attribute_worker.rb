require 'json'
require 'time'
puts "I got '#{params.inspect}' parameters"

puts "fixnum_arg: #{params["fixnum_arg"].to_i}"
puts "floatnum_arg: #{params["floatnum_arg"].to_f}"
puts "fixnum_arg: #{params["string_arg"].to_s}"
puts "Hash keys: #{JSON.parse(params["hash_arg"]).keys}"
puts "Time: #{Time.parse(params["time_arg"])}"
puts "Array elems count: #{JSON.parse(params["array_arg"]).count}"
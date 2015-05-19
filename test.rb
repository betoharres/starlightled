#!/Users/albertorocha/.rbenv/shims/ruby

x = IO.binread "LightingSystemApp.bin"
# x.each_byte do |y| print y.to_s(16) end
hex = []
x.each_byte do |y| hex << y end
hex_data = hex.pack('c*')
# out = hex.each_with_object("") { |e,s| s << Integer("0x#{e}") }
File.binwrite("example.bin", hex_data)
# puts hex_data[0..1200]
puts hex_data[1201..2400]

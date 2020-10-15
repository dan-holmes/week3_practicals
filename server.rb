require "socket"

server = TCPServer.new(2345)

while true
  socket = server.accept
  notes = []

  while true
    socket.puts "Add note:"

    they_said = socket.gets.chomp

    break if they_said == "quit"

    notes << they_said
    socket.puts "Added note: #{they_said}."
  end
  socket.puts "Your notes:"
  notes.each_with_index { |note, index| socket.puts "#{index + 1}. #{note}" }
  socket.puts "Goodbye."

  socket.close
end

#Library that contains TCPServer
require 'socket'

#Create a new instance of TCPServer using port 9292
server  = TCPServer.new(9292)

loop do
    #Wait for a request
    #When a request comes in save it to connection
    puts "Waiting for request..."
    connection = server.accept

    #When a request is recieved
    #Save the request line by line to request_lines
    puts "Got this request:"
    request_lines = []
    line = connection.gets.chomp

    while !line.empty?
        request_lines << line
        line = connection.gets.chomp
    end

    #Print the request lines
    puts request_lines

    #Generate the response
    puts "Sending response."
    output = "<html>Hello from the Server side!</html>"
    status = "http/1.1 200 ok"
    response = status + "\r\n" + "\r\n" + output

    #Send the response
    connection.puts response

    #Close the connection
    connection.close
end
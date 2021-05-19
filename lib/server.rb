require 'socket'

class Server
    def initialize()
        @server  = TCPServer.new(9292)

        loop do
            read_request()
            path_route(@request_lines[0])
            @connection.close
        end
    end

    def read_request()
        @connection = @server.accept
        @request_lines = []
        line = @connection.gets.chomp

        while !line.empty?
            @request_lines << line
            line = @connection.gets.chomp
        end
    end

    def path_route(request)
        if(request.include?("/welcome") || request.include?("/ "))
            @connection.puts "http/1.1 200 ok" + "\r\n" + "\r\n" + "<html>Welcome!</html>"
        elsif(request.include? "/user")
            @connection.puts "http/1.1 200 ok" + "\r\n" + "\r\n" + "<html>User page</html>"
        else
            @connection.puts "http/1.1 200 ok" + "\r\n" + "\r\n" + "<html>404 Error</html>"
        end
    end
end

tester = Server.new()
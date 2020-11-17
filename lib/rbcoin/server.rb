module RbCoin
  class Server
    def initialize(blockchain:, connection_pool:, p2p_protocol:)
      @blockchain      = blockchain
      @connection_pool = connection_pool
      @p2p_protocol    = p2p_protocol
      @external_ip     = nil
      @external_port   = nil
    end

    def get_external_ip
    end

    def handle_connection
    end

    def listen(hostname: "0.0.0.0", port: 8888)
      server = TCPServer.new(hostname, port)

      RbCoin.logger.info("Server listening on #{hostname}:#{port}")

      loop do
        Thread.start(server.accept) do |client|
          RbCoin.logger.info("New connection.")
          client.close
        end
      end
    end
  end
end
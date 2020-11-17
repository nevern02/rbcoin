# Standard lib
require "digest"
require "json"
require "logger"
require "socket"

# Gems
require "concurrent"

module RbCoin
  def self.logger
    @logger ||= Logger.new(STDOUT)
  end
end

require "rbcoin/blockchain"
require "rbcoin/server"
require "rbcoin/version"

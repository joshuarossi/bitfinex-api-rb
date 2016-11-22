module Bitfinex
  module TickerClient

    # Gives innermost bid and asks and information on the most recent trade, as well as high, low and volume of the last 24 hours.
    #
    # @param symbol [string] The name of hthe symbol
    # @return [Hash]
    # @example:
    #   client.ticker
    def ticker(symbol = "btcusd")
      if config.version == 2
        symbol ||= 'tBTCUSD'
      end
      get("pubticker/#{symbol}").body
    end

    # Call the specified block passing tickers, it uses websocket
    #
    # @param pair [string]
    # @param block [Block] The code to be executed when a new ticker is sent by the server 
    # @example:
    #   client.listen_ticker do |tick|
    #     puts tick.inspect
    #   end
    def listen_ticker(pair="BTCUSD", &block)
      if config.version == 2
        symbol ||= 'tBTCUSD'
      end
      raise BlockMissingError unless block_given?
      register_channel pair: pair, channel: "ticker", &block
    end
  end
end

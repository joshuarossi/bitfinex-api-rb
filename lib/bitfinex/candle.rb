module Bitfinex
  module CandleClient

    # Gives innermost bid and asks and information on the most recent trade, as well as high, low and volume of the last 24 hours.
    #
    # @param symbol [string] The name of hthe symbol
    # @return [Hash]
    # @example:
    #   client.ticker
    def candle(key = "trades:1m:tBTCUSD", context = "hist")
      get("stats1/#{symbol}/#{context}").body
    end

    # Call the specified block passing tickers, it uses websocket
    #
    # @param pair [string]
    # @param block [Block] The code to be executed when a new ticker is sent by the server 
    # @example:
    #   client.listen_ticker do |tick|
    #     puts tick.inspect
    #   end
    def listen_candle(key, context &block)
      key ||= 'trades:1m:tBTCUSD'
      context ||= 'hist'
      raise BlockMissingError unless block_given?
      register_channel pair: key, channel: "candle", &block
    end
  end
end

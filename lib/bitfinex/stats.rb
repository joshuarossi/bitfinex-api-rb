module Bitfinex
  module StatsClient

    # Various statistics about the requested pair.
    #
    # @param symbol [string] Symbol of the pair you want info about. Default 'btcusd'
    # @return [Array]
    # @example:
    #   client.stats('btcusd')
    def stats(symbol = "btcusd", context = "hist")
      if config.version == 2
        context ||= 'hist'
        symbol ||= 'funding.size:1m:fUSD'
        get("stats1/#{symbol}/#{context}").body
      end
      get("stats/#{symbol}").body
    end

    def listen_stats(key="trades:1m:tBTCUSD", context = 'hist', &block)
      raise BlockMissingError unless block_given?
      register_channel pair: symbol, channel: 'trades', &block
    end

  end
end

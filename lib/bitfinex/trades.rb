module Bitfinex
  module TradesClient

    # Get a list of the most recent trades for the given symbol.
    #
    # @param symbol [string] the name of the symbol
    # @param params :timestamp [time] Only show trades at or after this timestamp.
    # @param params :limit_trades [int] Limit the number of trades returned. Must be >= 1.
    # @return [Array]
    # @example:
    #   client.trades
    def trades(symbol="btcusd", params={})
      check_params(params, %i{timestamp limit_trades})
      get("trades/#{symbol}", params: params).body
    end

    # Listen to the trades using websocket.
    #
    # @param pair [string]
    # @param block [Block] The code to be executed when a new trade is executed
    # @example:
    #   client.listen_trades do |trade|
    #     puts trade.inspect
    #   end
    def listen_trades(pair="BTCUSD", &block)
      raise BlockMissingError unless block_given?
      register_channel pair:pair, channel: 'trades', &block
    end
  end
  module V2
    module REST
      module TradesClient
        def trades(symbol = 'tBTCUSD')
          get("trades/#{symbol}").body
        end
      end
    end
    module WS
      module TradesClient
        def listen_trades(symbol="tBTCUSD", &block)
          block ||= -> (msg) { print(msg) }
          register_channel symbol: symbol, channel: "trades", &block
        end
      end
    end
  end
end
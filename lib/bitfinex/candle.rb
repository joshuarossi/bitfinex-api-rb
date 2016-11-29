module Bitfinex
  module V2
    module REST
      module CandleClient
        def candle(key = "trades:1m:tBTCUSD", context = "hist")
          get("stats1/#{symbol}/#{context}").body
        end
      end
      module WS
        module CandleClient
          def listen_candle(key, context &block)
            key ||= 'trades:1m:tBTCUSD'
            context ||= 'hist'
            block ||= -> (msg) { puts msg }
            register_channel pair: key, channel: "candle", &block
          end
        end
      end
    end
  end
end
module Bitfinex
  class Client
    include Bitfinex::RestConnection
    include Bitfinex::WebsocketConnection
    include Bitfinex::AuthenticatedConnection
    include Bitfinex::TickerClient
    include Bitfinex::TradesClient
    include Bitfinex::FundingBookClient
    include Bitfinex::OrderbookClient
    include Bitfinex::StatsClient
    include Bitfinex::LendsClient
    include Bitfinex::SymbolsClient
    include Bitfinex::AccountInfoClient
    include Bitfinex::DepositClient
    include Bitfinex::OrdersClient
    include Bitfinex::PositionsClient
    include Bitfinex::HistoricalDataClient
    include Bitfinex::MarginFundingClient
    include Bitfinex::WalletClient
    include Bitfinex::Configurable
  end
  module V2
    class RestClient
      include Bitfinex::RestConnection
      include Bitfinex::AuthenticatedConnection
      include Bitfinex::Configurable
      include Bitfinex::V2::REST::TickerClient
      include Bitfinex::V2::REST::CandleClient
      include Bitfinex::V2::REST::TradesClient
      config.api_endpoint = "https://api.bitfinex.com/v2"
    end
    class WSClient
      include Bitfinex::WebsocketConnection
      include Bitfinex::Configurable
      include Bitfinex::V2::WS::TickerClient
      include Bitfinex::V2::WS::CandleClient
      include Bitfinex::V2::REST::TradesClient
      config.websocket_api_endpoint = "wss://dev-prdn.bitfinex.com:2998/ws/2"
    end
  end
end

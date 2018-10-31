require 'spec_helper'

describe ApplicationController do
  describe "CoinRPC::ConnectionRefusedError handling" do
    controller do
      def index
        raise CoinRPC::ConnectionRefusedError
      end
    end

    it 'renders errors/connection' 

  end
end


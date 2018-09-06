# frozen_string_literal: true

describe JsxcHelper, :type => :helper do
  before do
    AppConfig.chat.server.bosh.port = 1234
    AppConfig.chat.server.bosh.bind = "/bind"
  end

  describe "#get_bosh_endpoint" do
    it "using http scheme and default values" 


    it "using https scheme and no port" 

  end
end


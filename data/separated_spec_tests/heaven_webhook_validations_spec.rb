require "spec_helper"

describe WebhookValidations do
  include MetaHelper

  before { stub_meta }

  class WebhookValidationsTester
    class Request
      def initialize(ip)
        @ip = ip
      end
      attr_accessor :ip
    end
    include WebhookValidations

    def initialize(ip)
      @ip = ip
    end

    def request
      Request.new(@ip)
    end
  end

  it "makes methods available" 

end


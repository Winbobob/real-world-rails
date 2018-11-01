require_relative 'spec_helper'

# Simply returns the request context without any http response info.
class NoSendHandler < Seahorse::Client::Handler
  def call(context)
    Seahorse::Client::Response.new(context: context)
  end
end

module Aws
  module CloudSearchDomain
    describe Client do

      it 'supports unsigned requests' 


      it 'skips signing when given credentials are empty' 


      it 'signs requests when credentials given' 


      it 'ignores the globally configured region' 


      it 'can process empty response body errors' 


      it 'use `POST` for #search operation' 


    end
  end
end


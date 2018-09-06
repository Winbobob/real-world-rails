require 'rails_helper'

describe HostnameValidator do
  describe 'Hostname format should be as per RFC 1123' do
    before do
      @server = Server.new
      @valid_hostnames   = %w(
        abc
        123abc
        123.abc.def
        123.abc-def
        aaaaa.bbbbb.ccccc.dddd.eeee
        aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.com
      )
      @invalid_hostnames = %w{
        $abc
        abc(def)
        aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.com
      }
    end

    it 'should be valid' 


    it 'should be not valid' 

  end
end


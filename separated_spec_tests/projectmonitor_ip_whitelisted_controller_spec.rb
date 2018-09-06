require 'spec_helper'

describe IPWhitelistedController, type: :request do
  before :all do
    ENV["ip_whitelist"] = "['8.8.8.8', '6.6.6.6/28']"

    # Dynamically define a controller after configuring ip whitelist(see above).
    # The existing controllers are loaded before its configured and it causes this
    # module not to do anything.
    class AdminDashboardController < ApplicationController
      include IPWhitelistedController and skip_filter :authenticate_user!
      def index; head :ok; end
    end

    # Might be able to replace this with `with_routing` ...
    app.routes.send(:eval_block, ->{ get 'admin_dashboard', to: "admin_dashboard#index" })
  end

  after :all do
    ENV.delete("ip_whitelist")
    ENV.delete("ip_whitelist_request_proxied")
  end

  describe '#restrict_ip_address' do
    context 'in proxy mode' do
      before(:all) { ENV["ip_whitelist_request_proxied"] = 'true' }

      context 'when the proxy IP list is empty' do
        it 'should deny access' 

      end

      context 'when the proxy IP list is not empty' do
        context "and the client IP is in the whitelist" do
          it 'should allow access' 

        end

        context "and the client IP is not in the whitelist" do
          it 'should deny access' 

        end

        context "and the client IP is in the whitelist range" do
          it 'should allow access' 

        end

        context "and the client IP is not in the whitelist range" do
          it 'should deny access' 

        end

        context 'when there are multiple proxy IP addresses' do
          context "and it looks like it (probably) has remote ip in the whitelist" do
            it 'should allow access' 

          end

          context "and the last client IP is not in the whitelist" do
            it 'should deny access' 

          end
        end
      end
    end

    context 'not in proxy mode' do
      before(:all) { ENV["ip_whitelist_request_proxied"] = 'false' }

      context 'when the client IP is missing' do
        it 'should deny access' 

      end

      context 'when the client IP is present' do
        context 'and the client IP is in the whitelist' do
          it 'should allow access' 

        end

        context 'and the client IP is not in the whitelist' do
          it 'should deny access' 

        end

        context 'and the client IP is in the whitelist range' do
          it 'should allow all ip addresses in range' 


          context 'and the client IP is outside the whitelist range' do
            it 'should deny access' 

          end
        end
      end
    end
  end

  describe '.included' do
    let(:whitelisted_controller) { Class.new }

    before do
      allow(whitelisted_controller).to receive(:before_filter)
    end

    context 'an ip whitelist is specified' do
      context 'the whitelist contains single ip addresses' do
        it 'should add the authentication before filter' 


        it 'should add the ip whitelist before filter' 

      end
    end

    context 'no ip whitelist is specified' do
      before do
        allow(ConfigHelper).to receive(:get).with(:ip_whitelist).and_return(nil)
      end

      it 'should not add any filters' 

    end
  end
end


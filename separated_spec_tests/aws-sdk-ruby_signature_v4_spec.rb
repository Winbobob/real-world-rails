require_relative '../../spec_helper'

module Aws
  module Plugins
    describe SignatureV4 do

      Sigv4Client = ApiHelper.sample_service(metadata: {
        'signatureVersion' => 'v4',
        'endpointPrefix' => 'svc-name',
      }).const_get(:Client)

      let(:plugin) { SignatureV4.new }

      let(:options) {{
        region: 'us-east-1',
        access_key_id: 'akid',
        secret_access_key: 'secret',
      }}

      it 'raises an error when attempting to sign a request w/out credentials' 


      describe 'sigv4 signing name' do

        it 'accepts a sigv4 signing name configuration option' 


        it 'defaults the sigv4 name to the endpoint prefix' 


        it 'prefers the signingName over endpointPrefix' 


      end

      describe 'sigv4 signing region' do

        it 'defaults to us-east-1 for global endpoints' 


        it 'defaults to configured region if it can not be extracted' 


        it 'uses the specified region when no endpointPrefix is present' 


      end

      describe 'apply authtype trait' do

        let(:api) {{
          'metadata' => {
            'protocol' => 'rest-xml',
            'signatureVersion' => 'v4',
            'endpointPrefix' => 'svc-name',
          },
          'operations' => {
            'StreamingFoo' => {
              'name' => 'StreamingFoo',
              'http' => {
                'method' => 'POST',
                'requestUri' => '/foo/{fooName}'
              },
              'input' => {
                'shape' => 'StreamingFooRequest'
              },
              'output' => {
                'shape' => 'StreamingFooResponse'
              },
              'authtype'=> 'v4-unsigned-body'
            },
            'NonStreamingBar' => {
              'name' => 'NonStreamingBar',
              'http' => {
                'method' => 'POST',
                'requestUri' => '/bar/{barName}'
              },
              'input' => {
                'shape' => 'NonStreamingBarRequest'
              },
              'output' => {
                'shape' => 'NonStreamingBarResponse'
              },
            }
          },
          'shapes' => {
            'FooName' => {
              'type' => 'string'
            },
            'BarName' => {
              'type' => 'string'
            },
            'Boolean' => {
              'type' => 'boolean'
            },
            'StreamingFooRequest' => {
              'type' => 'structure',
              'members' => {
                'fooName' => {
                  'shape' => 'FooName',
                  'location' => 'uri',
                  'locationName' => 'fooName'
                }
              }
            },
            'NonStreamingBarRequest' => {
              'type' => 'structure',
                'members' => {
                  'barName' => {
                    'shape' => 'BarName',
                    'location' => 'uri',
                    'locationName' => 'barName'
                  }
                }
              },
              'StreamingFooResponse' => {
                'type' => 'structure',
                'members' => {
                  'Return' => {
                    'shape' => 'Boolean',
                    'locationName' => 'return'
                  }
                }
              },
              'NonStreamingBarResponse' => {
                'type' => 'structure',
                'members' => {
                  'Return' => {
                  'shape' => 'Boolean',
                  'locationName' => 'return'
                }
              }
            }
          }
        }}
        let(:svc) { ApiHelper.sample_service(api: api) }
        let(:client) {
          svc::Client.new(options.merge(
            region: 'region',
            endpoint: 'https://domain.region.amazonaws.com',
            stub_responses: true
          ))
        }

        let(:datetime) { '20120101T10:11:12Z' }
        let(:now) { Time.now }
        let(:utc) { now.utc }

        before(:each) {
          allow(Time).to receive(:now).and_return(now)
          allow(now).to receive(:utc).and_return(utc)
          allow(utc).to receive(:strftime).and_return(datetime)
        }

        it `unsigns payload for operations has 'v4-unsigned-payload' for 'authtype'` do
          resp = client.streaming_foo(foo_name: 'foo')
          req = resp.context.http_request
          expect(req.headers['x-amz-content-sha256']).to eq('UNSIGNED-PAYLOAD')
          expect(req.headers['authorization']).to eq('AWS4-HMAC-SHA256 Credential=stubbed-akid/20120101/region/svc-name/aws4_request, SignedHeaders=host;x-amz-content-sha256;x-amz-date, Signature=6d86306ea8dcf03db133cd35bcf626b0a440daefadc8ddde3304517126edb1bb')
        end

        it `signs payload for operations without 'v4-unsigned-payload' for 'authtype'` do
          resp = client.non_streaming_bar(bar_name: 'bar')
          req = resp.context.http_request
          expect(req.headers['x-amz-content-sha256']).not_to eq('UNSIGNED-PAYLOAD')
          expect(req.headers['authorization']).to eq('AWS4-HMAC-SHA256 Credential=stubbed-akid/20120101/region/svc-name/aws4_request, SignedHeaders=host;x-amz-content-sha256;x-amz-date, Signature=c6394995838d4b4a1ec9b19229d92bac3f11441308f953d89306663230e95713')
        end

        it `signs payload for HTTP request even when 'v4-unsigned-payload' is set` do
          client = svc::Client.new(options.merge(
            region: 'region',
            endpoint: 'http://domain.region.amazonaws.com',
            stub_responses: true
          ))
          resp = client.streaming_foo(foo_name: 'foo')
          req = resp.context.http_request
          expect(req.headers['x-amz-content-sha256']).not_to eq('UNSIGNED-PAYLOAD')
          expect(req.headers['authorization']).to eq('AWS4-HMAC-SHA256 Credential=stubbed-akid/20120101/region/svc-name/aws4_request, SignedHeaders=host;x-amz-content-sha256;x-amz-date, Signature=0b7174139a9847c6e1dd4b3b56bfe95e88f8550cdf02e84561c6b18111579e11')
        end

      end
    end
  end
end


require 'rails_helper'

describe Gitlab::DependencyLinker::PodspecJsonLinker do
  describe '.support?' do
    it 'supports *.podspec.json' 


    it 'does not support other files' 

  end

  describe '#link' do
    let(:file_name) { "AFNetworking.podspec.json" }

    let(:file_content) do
      <<-CONTENT.strip_heredoc
        {
          "name": "AFNetworking",
          "version": "2.0.0",
          "license": "MIT",
          "summary": "A delightful iOS and OS X networking framework.",
          "homepage": "https://github.com/AFNetworking/AFNetworking",
          "authors": {
            "Mattt Thompson": "m@mattt.me"
          },
          "source": {
            "git": "https://github.com/AFNetworking/AFNetworking.git",
            "tag": "2.0.0",
            "submodules": true
          },
          "requires_arc": true,
          "platforms": {
            "ios": "6.0",
            "osx": "10.8"
          },
          "public_header_files": "AFNetworking/*.h",
          "subspecs": [
            {
              "name": "NSURLConnection",
              "dependencies": {
                "AFNetworking/Serialization": [

                ],
                "AFNetworking/Reachability": [

                ],
                "AFNetworking/Security": [

                ]
              },
              "source_files": [
                "AFNetworking/AFURLConnectionOperation.{h,m}",
                "AFNetworking/AFHTTPRequestOperation.{h,m}",
                "AFNetworking/AFHTTPRequestOperationManager.{h,m}"
              ]
            }
          ]
        }
      CONTENT
    end

    subject { Gitlab::Highlight.highlight(file_name, file_content) }

    def link(name, url)
      %{<a href="#{url}" rel="nofollow noreferrer noopener" target="_blank">#{name}</a>}
    end

    it 'links the gem name' 


    it 'links the license' 


    it 'links the homepage' 


    it 'links the source URL' 


    it 'links dependencies' 


    it 'does not link subspec names' 

  end
end


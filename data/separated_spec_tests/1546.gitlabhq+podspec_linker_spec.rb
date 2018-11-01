require 'rails_helper'

describe Gitlab::DependencyLinker::PodspecLinker do
  describe '.support?' do
    it 'supports *.podspec' 


    it 'does not support other files' 

  end

  describe '#link' do
    let(:file_name) { "Reachability.podspec" }

    let(:file_content) do
      <<-CONTENT.strip_heredoc
        Pod::Spec.new do |spec|
          spec.name         = 'Reachability'
          spec.version      = '3.1.0'
          spec.license      = { :type => 'GPL-3.0' }
          spec.license      = "MIT"
          spec.license      = { type: 'Apache-2.0' }
          spec.homepage     = 'https://github.com/tonymillion/Reachability'
          spec.authors      = { 'Tony Million' => 'tonymillion@gmail.com' }
          spec.summary      = 'ARC and GCD Compatible Reachability Class for iOS and OS X.'
          spec.source       = { :git => 'https://github.com/tonymillion/Reachability.git', :tag => 'v3.1.0' }
          spec.source_files = 'Reachability.{h,m}'
          spec.framework    = 'SystemConfiguration'

          spec.dependency 'AFNetworking', '~> 1.0'
          spec.dependency 'RestKit/CoreData', '~> 0.20.0'
          spec.ios.dependency 'MBProgressHUD', '~> 0.5'
        end
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

  end
end


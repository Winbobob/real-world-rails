require 'rails_helper'

describe Gitlab::DependencyLinker::PodfileLinker do
  describe '.support?' do
    it 'supports Podfile' 


    it 'does not support other files' 

  end

  describe '#link' do
    let(:file_name) { "Podfile" }

    let(:file_content) do
      <<-CONTENT.strip_heredoc
        source 'https://github.com/artsy/Specs.git'
        source 'https://github.com/CocoaPods/Specs.git'

        platform :ios, '8.0'
        use_frameworks!
        inhibit_all_warnings!

        target 'Artsy' do
          pod 'AFNetworking', "~> 2.5"
          pod 'Interstellar/Core', git: 'https://github.com/ashfurrow/Interstellar.git', branch: 'observable-unsubscribe'
        end
      CONTENT
    end

    subject { Gitlab::Highlight.highlight(file_name, file_content) }

    def link(name, url)
      %{<a href="#{url}" rel="nofollow noreferrer noopener" target="_blank">#{name}</a>}
    end

    it 'links sources' 


    it 'links packages' 


    it 'links Git repos' 

  end
end


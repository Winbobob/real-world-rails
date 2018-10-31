require 'rails_helper'

describe Gitlab::DependencyLinker::GemfileLinker do
  describe '.support?' do
    it 'supports Gemfile' 


    it 'supports gems.rb' 


    it 'does not support other files' 

  end

  describe '#link' do
    let(:file_name) { 'Gemfile' }

    let(:file_content) do
      <<-CONTENT.strip_heredoc
        source 'https://rubygems.org'

        gem "rails", '4.2.6', github: "rails/rails"
        gem 'rails-deprecated_sanitizer', '~> 1.0.3'
        gem 'responders', '~> 2.0', :github => 'rails/responders'
        gem 'sprockets', '~> 3.6.0', git: 'https://gitlab.example.com/gems/sprockets'
        gem 'default_value_for', '~> 3.0.0'
      CONTENT
    end

    subject { Gitlab::Highlight.highlight(file_name, file_content) }

    def link(name, url)
      %{<a href="#{url}" rel="nofollow noreferrer noopener" target="_blank">#{name}</a>}
    end

    it 'links sources' 


    it 'links dependencies' 


    it 'links GitHub repos' 


    it 'links Git repos' 

  end
end


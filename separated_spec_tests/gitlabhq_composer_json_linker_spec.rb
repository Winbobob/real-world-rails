require 'rails_helper'

describe Gitlab::DependencyLinker::ComposerJsonLinker do
  describe '.support?' do
    it 'supports composer.json' 


    it 'does not support other files' 

  end

  describe '#link' do
    let(:file_name) { "composer.json" }

    let(:file_content) do
      <<-CONTENT.strip_heredoc
        {
          "name": "laravel/laravel",
          "homepage": "https://laravel.com/",
          "description": "The Laravel Framework.",
          "keywords": ["framework", "laravel"],
          "license": "MIT",
          "type": "project",
          "repositories": [
            {
              "type": "git",
              "url": "https://github.com/laravel/laravel.git"
            }
          ],
          "require": {
            "php": ">=5.5.9",
            "laravel/framework": "5.2.*"
          },
          "require-dev": {
            "fzaninotto/faker": "~1.4",
            "mockery/mockery": "0.9.*",
            "phpunit/phpunit": "~4.0",
            "symfony/css-selector": "2.8.*|3.0.*",
            "symfony/dom-crawler": "2.8.*|3.0.*"
          }
        }
      CONTENT
    end

    subject { Gitlab::Highlight.highlight(file_name, file_content) }

    def link(name, url)
      %{<a href="#{url}" rel="nofollow noreferrer noopener" target="_blank">#{name}</a>}
    end

    it 'links the module name' 


    it 'links the homepage' 


    it 'links the repository URL' 


    it 'links the license' 


    it 'links dependencies' 


    it 'does not link core dependencies' 

  end
end


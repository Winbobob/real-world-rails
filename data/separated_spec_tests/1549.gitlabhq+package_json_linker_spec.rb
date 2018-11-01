require 'rails_helper'

describe Gitlab::DependencyLinker::PackageJsonLinker do
  describe '.support?' do
    it 'supports package.json' 


    it 'does not support other files' 

  end

  describe '#link' do
    let(:file_name) { "package.json" }

    let(:file_content) do
      <<-CONTENT.strip_heredoc
        {
          "name": "module-name",
          "version": "10.3.1",
          "repository": {
            "type": "git",
            "url": "https://github.com/vuejs/vue.git"
          },
          "homepage": "https://github.com/vuejs/vue#readme",
          "scripts": {
            "karma": "karma start config/karma.config.js --single-run"
          },
          "dependencies": {
            "primus": "*",
            "async": "~0.8.0",
            "express": "4.2.x",
            "bigpipe": "bigpipe/pagelet",
            "plates": "https://github.com/flatiron/plates/tarball/master",
            "karma": "^1.4.1"
          },
          "devDependencies": {
            "vows": "^0.7.0",
            "assume": "<1.0.0 || >=2.3.1 <2.4.5 || >=2.5.2 <3.0.0",
            "pre-commit": "*"
          },
          "license": "MIT"
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


    it 'links GitHub repos' 


    it 'links Git repos' 


    it 'does not link scripts with the same key as a package' 

  end
end


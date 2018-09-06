require 'rails_helper'

describe Gitlab::DependencyLinker::GemspecLinker do
  describe '.support?' do
    it 'supports *.gemspec' 


    it 'does not support other files' 

  end

  describe '#link' do
    let(:file_name) { "gitlab_git.gemspec" }

    let(:file_content) do
      <<-CONTENT.strip_heredoc
        Gem::Specification.new do |s|
          s.name        = 'gitlab_git'
          s.version     = `cat VERSION`
          s.date        = Time.now.strftime('%Y-%m-%d')
          s.summary     = "Gitlab::Git library"
          s.description = "GitLab wrapper around git objects"
          s.authors     = ["Dmitriy Zaporozhets"]
          s.email       = 'dmitriy.zaporozhets@gmail.com'
          s.license     = 'MIT'
          s.files       = `git ls-files lib/`.split('\n') << 'VERSION'
          s.homepage    = 'https://gitlab.com/gitlab-org/gitlab_git'

          s.add_dependency('github-linguist', '~> 4.7.0')
          s.add_dependency('activesupport', '~> 4.0')
          s.add_dependency('rugged', '~> 0.24.0')
          s.add_runtime_dependency('charlock_holmes', '~> 0.7.3')
          s.add_development_dependency('listen', '~> 3.0.6')
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


    it 'links dependencies' 

  end
end


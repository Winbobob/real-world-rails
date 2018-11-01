require 'rails_helper'

describe Gitlab::DependencyLinker::GodepsJsonLinker do
  describe '.support?' do
    it 'supports Godeps.json' 


    it 'does not support other files' 

  end

  describe '#link' do
    let(:file_name) { "Godeps.json" }

    let(:file_content) do
      <<-CONTENT.strip_heredoc
        {
        	"ImportPath": "gitlab.com/gitlab-org/gitlab-pages",
        	"GoVersion": "go1.5",
        	"Packages": [
        		"./..."
        	],
        	"Deps": [
        		{
        			"ImportPath": "github.com/kardianos/osext",
        			"Rev": "efacde03154693404c65e7aa7d461ac9014acd0c"
        		},
        		{
        			"ImportPath": "github.com/stretchr/testify/assert",
        			"Rev": "1297dc01ed0a819ff634c89707081a4df43baf6b"
        		},
        		{
        			"ImportPath": "github.com/stretchr/testify/require",
        			"Rev": "1297dc01ed0a819ff634c89707081a4df43baf6b"
        		},
        		{
        			"ImportPath": "gitlab.com/group/project/path",
        			"Rev": "1297dc01ed0a819ff634c89707081a4df43baf6b"
        		},
        		{
        			"ImportPath": "gitlab.com/group/subgroup/project.git/path",
        			"Rev": "1297dc01ed0a819ff634c89707081a4df43baf6b"
        		},
        		{
        			"ImportPath": "golang.org/x/crypto/ssh/terminal",
        			"Rev": "1351f936d976c60a0a48d728281922cf63eafb8d"
        		},
        		{
        			"ImportPath": "golang.org/x/net/http2",
        			"Rev": "b4e17d61b15679caf2335da776c614169a1b4643"
        		}
        	]
        }
      CONTENT
    end

    subject { Gitlab::Highlight.highlight(file_name, file_content) }

    def link(name, url)
      %{<a href="#{url}" rel="nofollow noreferrer noopener" target="_blank">#{name}</a>}
    end

    it 'links the package name' 


    it 'links GitHub repos' 


    it 'links GitLab projects' 


    it 'links Golang packages' 

  end
end


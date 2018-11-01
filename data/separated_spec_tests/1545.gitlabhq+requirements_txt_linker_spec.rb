require 'rails_helper'

describe Gitlab::DependencyLinker::RequirementsTxtLinker do
  describe '.support?' do
    it 'supports requirements.txt' 


    it 'supports doc-requirements.txt' 


    it 'does not support other files' 

  end

  describe '#link' do
    let(:file_name) { "requirements.txt" }

    let(:file_content) do
      <<-CONTENT.strip_heredoc
        #
        ####### example-requirements.txt #######
        #
        ###### Requirements without Version Specifiers ######
        nose
        nose-cov
        beautifulsoup4
        #
        ###### Requirements with Version Specifiers ######
        #   See https://www.python.org/dev/peps/pep-0440/#version-specifiers
        docopt == 0.6.1             # Version Matching. Must be version 0.6.1
        keyring >= 4.1.1            # Minimum version 4.1.1
        coverage != 3.5             # Version Exclusion. Anything except version 3.5
        Mopidy-Dirble ~= 1.1        # Compatible release. Same as >= 1.1, == 1.*
        #
        ###### Refer to other requirements files ######
        -r other-requirements.txt
        #
        #
        ###### A particular file ######
        ./downloads/numpy-1.9.2-cp34-none-win32.whl
        http://wxpython.org/Phoenix/snapshot-builds/wxPython_Phoenix-3.0.3.dev1820+49a8884-cp34-none-win_amd64.whl
        #
        ###### Additional Requirements without Version Specifiers ######
        #   Same as 1st section, just here to show that you can put things in any order.
        rejected
        green
        #

        Jinja2>=2.3
        Pygments>=1.2
        Sphinx>=1.3
        docutils>=0.7
        markupsafe
        pytest~=3.0
        foop!=3.0
      CONTENT
    end

    subject { Gitlab::Highlight.highlight(file_name, file_content) }

    def link(name, url)
      %{<a href="#{url}" rel="nofollow noreferrer noopener" target="_blank">#{name}</a>}
    end

    it 'links dependencies' 


    it 'links URLs' 


    it 'does not contain link with a newline as package name' 

  end
end


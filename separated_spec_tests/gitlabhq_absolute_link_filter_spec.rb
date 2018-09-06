require 'spec_helper'

describe Banzai::Filter::AbsoluteLinkFilter do
  def filter(doc, context = {})
    described_class.call(doc, context)
  end

  context 'with html links' do
    context 'if only_path is false' do
      let(:only_path_context) do
        { only_path: false }
      end
      let(:fake_url) { 'http://www.example.com' }

      before do
        allow(Gitlab.config.gitlab).to receive(:url).and_return(fake_url)
      end

      context 'has the .gfm class' do
        it 'converts a relative url into absolute' 


        it 'does not change the url if it already absolute' 


        context 'if relative_url_root is set' do
          it 'joins the url without without doubling the path' 

        end
      end

      context 'has not the .gfm class' do
        it 'does not convert a relative url into absolute' 

      end
    end

    context 'if only_path is not false' do
      it 'does not convert a relative url into absolute' 

    end
  end

  def link(path, css_class = '')
    %(<a class="#{css_class}" href="#{path}">example</a>)
  end
end


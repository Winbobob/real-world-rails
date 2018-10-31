require 'spec_helper'

shared_examples 'an external link with rel attribute' do
  it 'adds rel="nofollow" to external links' 


  it 'adds rel="noreferrer" to external links' 


  it 'adds rel="noopener" to external links' 

end

describe Banzai::Filter::ExternalLinkFilter do
  include FilterSpecHelper

  it 'ignores elements without an href attribute' 


  it 'ignores non-HTTP(S) links' 


  it 'skips internal links' 


  context 'for root links on document' do
    let(:doc) { filter %q(<a href="https://google.com/">Google</a>) }

    it_behaves_like 'an external link with rel attribute'
  end

  context 'for nested links on document' do
    let(:doc) { filter %q(<p><a href="https://google.com/">Google</a></p>) }

    it_behaves_like 'an external link with rel attribute'
  end

  context 'for invalid urls' do
    it 'skips broken hrefs' 


    it 'skips improperly formatted mailtos' 

  end

  context 'for links with a username' do
    context 'with a valid username' do
      let(:doc) { filter %q(<a href="https://user@google.com/">Google</a>) }

      it_behaves_like 'an external link with rel attribute'
    end

    context 'with an impersonated username' do
      let(:internal) { Gitlab.config.gitlab.url }

      let(:doc) { filter %Q(<a href="https://#{internal}@example.com" target="_blank">Reverse Tabnabbing</a>) }

      it_behaves_like 'an external link with rel attribute'
    end
  end

  context 'for non-lowercase scheme links' do
    context 'with http' do
      let(:doc) { filter %q(<p><a href="httP://google.com/">Google</a></p>) }

      it_behaves_like 'an external link with rel attribute'
    end

    context 'with https' do
      let(:doc) { filter %q(<p><a href="hTTpS://google.com/">Google</a></p>) }

      it_behaves_like 'an external link with rel attribute'
    end

    it 'skips internal links' 


    it 'skips relative links' 

  end

  context 'for protocol-relative links' do
    let(:doc) { filter %q(<p><a href="//google.com/">Google</a></p>) }

    it_behaves_like 'an external link with rel attribute'
  end
end


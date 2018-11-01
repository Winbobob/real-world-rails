require 'rails_helper'

RSpec.describe ActivityPub::FetchRemoteAccountService, type: :service do
  subject { ActivityPub::FetchRemoteAccountService.new }

  let!(:actor) do
    {
      '@context': 'https://www.w3.org/ns/activitystreams',
      id: 'https://example.com/alice',
      type: 'Person',
      preferredUsername: 'alice',
      name: 'Alice',
      summary: 'Foo bar',
      inbox: 'http://example.com/alice/inbox',
    }
  end

  describe '#call' do
    let(:account) { subject.call('https://example.com/alice', id: true) }

    shared_examples 'sets profile data' do
      it 'returns an account' 


      it 'sets display name' 


      it 'sets note' 


      it 'sets URL' 

    end

    context 'when the account does not have a inbox' do
      let!(:webfinger) { { subject: 'acct:alice@example.com', links: [{ rel: 'self', href: 'https://example.com/alice' }] } }

      before do
        actor[:inbox] = nil

        stub_request(:get, 'https://example.com/alice').to_return(body: Oj.dump(actor))
        stub_request(:get, 'https://example.com/.well-known/webfinger?resource=acct:alice@example.com').to_return(body: Oj.dump(webfinger), headers: { 'Content-Type': 'application/jrd+json' })
      end

      it 'fetches resource' 


      it 'looks up webfinger' 


      it 'returns nil' 

    end

    context 'when URI and WebFinger share the same host' do
      let!(:webfinger) { { subject: 'acct:alice@example.com', links: [{ rel: 'self', href: 'https://example.com/alice' }] } }

      before do
        stub_request(:get, 'https://example.com/alice').to_return(body: Oj.dump(actor))
        stub_request(:get, 'https://example.com/.well-known/webfinger?resource=acct:alice@example.com').to_return(body: Oj.dump(webfinger), headers: { 'Content-Type': 'application/jrd+json' })
      end

      it 'fetches resource' 


      it 'looks up webfinger' 


      it 'sets username and domain from webfinger' 


      include_examples 'sets profile data'
    end

    context 'when WebFinger presents different domain than URI' do
      let!(:webfinger) { { subject: 'acct:alice@iscool.af', links: [{ rel: 'self', href: 'https://example.com/alice' }] } }

      before do
        stub_request(:get, 'https://example.com/alice').to_return(body: Oj.dump(actor))
        stub_request(:get, 'https://example.com/.well-known/webfinger?resource=acct:alice@example.com').to_return(body: Oj.dump(webfinger), headers: { 'Content-Type': 'application/jrd+json' })
        stub_request(:get, 'https://iscool.af/.well-known/webfinger?resource=acct:alice@iscool.af').to_return(body: Oj.dump(webfinger), headers: { 'Content-Type': 'application/jrd+json' })
      end

      it 'fetches resource' 


      it 'looks up webfinger' 


      it 'looks up "redirected" webfinger' 


      it 'sets username and domain from final webfinger' 


      include_examples 'sets profile data'
    end

    context 'with wrong id' do
      it 'does not create account' 

    end
  end
end


require 'rails_helper'

RSpec.describe ResolveAccountService, type: :service do
  subject { described_class.new }

  before do
    stub_request(:get, "https://quitter.no/.well-known/host-meta").to_return(request_fixture('.host-meta.txt'))
    stub_request(:get, "https://example.com/.well-known/webfinger?resource=acct:catsrgr8@example.com").to_return(status: 404)
    stub_request(:get, "https://redirected.com/.well-known/host-meta").to_return(request_fixture('redirected.host-meta.txt'))
    stub_request(:get, "https://example.com/.well-known/host-meta").to_return(status: 404)
    stub_request(:get, "https://quitter.no/.well-known/webfinger?resource=acct:gargron@quitter.no").to_return(request_fixture('webfinger.txt'))
    stub_request(:get, "https://redirected.com/.well-known/webfinger?resource=acct:gargron@redirected.com").to_return(request_fixture('webfinger.txt'))
    stub_request(:get, "https://redirected.com/.well-known/webfinger?resource=acct:hacker1@redirected.com").to_return(request_fixture('webfinger-hacker1.txt'))
    stub_request(:get, "https://redirected.com/.well-known/webfinger?resource=acct:hacker2@redirected.com").to_return(request_fixture('webfinger-hacker2.txt'))
    stub_request(:get, "https://quitter.no/.well-known/webfinger?resource=acct:catsrgr8@quitter.no").to_return(status: 404)
    stub_request(:get, "https://quitter.no/api/statuses/user_timeline/7477.atom").to_return(request_fixture('feed.txt'))
    stub_request(:get, "https://quitter.no/avatar/7477-300-20160211190340.png").to_return(request_fixture('avatar.txt'))
    stub_request(:get, "https://localdomain.com/.well-known/host-meta").to_return(request_fixture('localdomain-hostmeta.txt'))
    stub_request(:get, "https://localdomain.com/.well-known/webfinger?resource=acct:foo@localdomain.com").to_return(status: 404)
    stub_request(:get, "https://webdomain.com/.well-known/webfinger?resource=acct:foo@localdomain.com").to_return(request_fixture('localdomain-webfinger.txt'))
    stub_request(:get, "https://webdomain.com/users/foo.atom").to_return(request_fixture('localdomain-feed.txt'))
  end

  it 'raises error if no such user can be resolved via webfinger' 


  it 'raises error if the domain does not have webfinger' 


  it 'prevents hijacking existing accounts' 


  it 'prevents hijacking inexisting accounts' 


  context 'with an OStatus account' do
    it 'returns an already existing remote account' 


    it 'returns a new remote account' 


    it 'follows a legitimate account redirection' 


    it 'returns a new remote account' 

  end

  context 'with an ActivityPub account' do
    before do
      stub_request(:get, "https://ap.example.com/.well-known/webfinger?resource=acct:foo@ap.example.com").to_return(request_fixture('activitypub-webfinger.txt'))
      stub_request(:get, "https://ap.example.com/users/foo").to_return(request_fixture('activitypub-actor.txt'))
      stub_request(:get, "https://ap.example.com/users/foo.atom").to_return(request_fixture('activitypub-feed.txt'))
      stub_request(:get, %r{https://ap.example.com/users/foo/\w+}).to_return(status: 404)
    end

    it 'fallback to OStatus if actor json could not be fetched' 


    it 'fallback to OStatus if actor json did not have inbox_url' 


    it 'returns new remote account' 


    context 'with multiple types' do
      before do
        stub_request(:get, "https://ap.example.com/users/foo").to_return(request_fixture('activitypub-actor-individual.txt'))
      end

      it 'returns new remote account' 

    end

    pending
  end

  it 'processes one remote account at a time using locks' 

end


require 'rails_helper'

RSpec.describe ProcessFeedService, type: :service do
  subject { ProcessFeedService.new }

  describe 'processing a feed' do
    let(:body) { File.read(Rails.root.join('spec', 'fixtures', 'xml', 'mastodon.atom')) }
    let(:account) { Fabricate(:account, username: 'localhost', domain: 'kickass.zone') }

    before do
      stub_request(:post, "https://pubsubhubbub.superfeedr.com/").to_return(:status => 200, :body => "", :headers => {})
      stub_request(:head, "http://kickass.zone/media/2").to_return(:status => 404)
      stub_request(:head, "http://kickass.zone/media/3").to_return(:status => 404)
      stub_request(:get, "http://kickass.zone/system/accounts/avatars/000/000/001/large/eris.png").to_return(request_fixture('avatar.txt'))
      stub_request(:get, "http://kickass.zone/system/media_attachments/files/000/000/002/original/morpheus_linux.jpg?1476059910").to_return(request_fixture('attachment1.txt'))
      stub_request(:get, "http://kickass.zone/system/media_attachments/files/000/000/003/original/gizmo.jpg?1476060065").to_return(request_fixture('attachment2.txt'))
    end

    context 'when domain does not reject media' do
      before do
        subject.call(body, account)
      end

      it 'updates remote user\'s account information' 


      it 'creates posts' 


      it 'marks replies as replies' 


      it 'sets account being replied to when possible' 


      it 'ignores delete statuses unless they existed before' 


      it 'does not create statuses for follows' 


      it 'does not create statuses for favourites' 


      it 'creates posts with media' 

    end

    context 'when domain is set to reject media' do
      let!(:domain_block) { Fabricate(:domain_block, domain: 'kickass.zone', reject_media: true) }

      before do
        subject.call(body, account)
      end

      it 'updates remote user\'s account information' 


      it 'rejects remote user\'s avatar' 


      it 'creates posts' 


      it 'creates posts with remote-only media' 

    end
  end

  it 'does not accept tampered reblogs' 


  it 'ignores reblogs if it failed to retrieve reblogged statuses' 


  it 'ignores statuses with an out-of-order delete' 

end


require 'rails_helper'

RSpec.describe OStatus::AtomSerializer do
  shared_examples 'follow request salmon' do
    it 'appends author element with account' 


    it 'appends activity:object-type element with activity type' 


    it 'appends activity:verb element with request_friend type' 


    it 'appends activity:object with target account' 

  end

  shared_examples 'namespaces' do
    it 'adds namespaces' 

  end

  shared_examples 'no namespaces' do
    it 'does not add namespaces' 

  end

  shared_examples 'status attributes' do
    it 'appends summary element with spoiler text if present' 


    it 'does not append summary element with spoiler text if not present' 


    it 'appends content element with formatted status' 


    it 'appends link elements for mentioned accounts' 


    it 'appends link elements for emojis' 

  end

  describe 'render' do
    it 'returns XML with emojis' 


    it 'returns XML, stripping invalid characters like \b and \v' 

  end

  describe '#author' do
    context 'when note is present' do
      it 'appends poco:note element with note for local account' 


      it 'appends poco:note element with tags-stripped note for remote account' 


      it 'appends summary element with type attribute and simplified note if present' 

    end

    context 'when note is not present' do
      it 'does not append poco:note element' 


      it 'does not append summary element' 

    end

    it 'returns author element' 


    it 'appends activity:object-type element with person type' 


    it 'appends email element with username and domain for local account' 


    it 'appends email element with username and domain for remote user' 


    it 'appends link element for an alternative' 


    it 'has link element for avatar if present' 


    it 'does not have link element for avatar if not present' 


    it 'appends link element for header if present' 


    it 'does not append link element for header if not present' 


    it 'appends poco:displayName element with display name if present' 


    it 'does not append poco:displayName element with display name if not present' 


    it "appends mastodon:scope element with 'private' if locked" 


    it "appends mastodon:scope element with 'public' if unlocked" 


    it 'includes URI' 


    it 'includes username' 

  end

  describe '#entry' do
    shared_examples 'not root' do
      include_examples 'no namespaces' do
        def serialize
          subject
        end
      end

      it 'does not append author element' 

    end

    context 'it is root' do
      include_examples 'namespaces' do
        def serialize
          stream_entry = Fabricate(:stream_entry)
          OStatus::AtomSerializer.new.entry(stream_entry, true)
        end
      end

      it 'appends author element' 

    end

    context 'if status is present' do
      include_examples 'status attributes' do
        def serialize(status)
          OStatus::AtomSerializer.new.entry(status.stream_entry, true)
        end
      end

      it 'appends link element for the public collection if status is publicly visible' 


      it 'does not append link element for the public collection if status is not publicly visible' 


      it 'appends category elements for tags' 


      it 'appends link elements for media attachments' 


      it 'appends mastodon:scope element with visibility' 


      it 'returns element whose rendered view triggers creation when processed' 

    end

    context 'if status is not present' do
      it 'appends content element saying status is deleted' 


      it 'appends title element saying the status is deleted' 

    end

    context 'it is not root' do
      let(:stream_entry) { Fabricate(:stream_entry) }
      subject { OStatus::AtomSerializer.new.entry(stream_entry, false) }
      include_examples 'not root'
    end

    context 'without root parameter' do
      let(:stream_entry) { Fabricate(:stream_entry) }
      subject { OStatus::AtomSerializer.new.entry(stream_entry) }
      include_examples 'not root'
    end

    it 'returns entry element' 


    it 'appends id element with unique tag' 


    it 'appends published element with created date' 


    it 'appends updated element with updated date' 


    it 'appends title element with status title' 


    it 'appends activity:object-type element with object type' 


    it 'appends activity:verb element with object type' 


    it 'appends activity:object element with target if present' 


    it 'does not append activity:object element if target is not present' 


    it 'appends link element for an alternative' 


    it 'appends link element for itself' 


    it 'appends thr:in-reply-to element if threaded' 


    it 'does not append thr:in-reply-to element if not threaded' 


    it 'appends ostatus:conversation if conversation id is present' 


    it 'does not append ostatus:conversation if conversation id is not present' 

  end

  describe '#feed' do
    include_examples 'namespaces' do
      def serialize
        account = Fabricate(:account)
        OStatus::AtomSerializer.new.feed(account, [])
      end
    end

    it 'returns feed element' 


    it 'appends id element with account Atom URL' 


    it 'appends title element with account display name if present' 


    it 'does not append title element with account username if account display name is not present' 


    it 'appends subtitle element with account note' 


    it 'appends updated element with date account got updated' 


    it 'appends logo element with full asset URL for original account avatar' 


    it 'appends author element' 


    it 'appends link element for an alternative' 


    it 'appends link element for itself' 


    it 'appends link element for the next if it has 20 stream entries' 


    it 'does not append link element for the next if it does not have 20 stream entries' 


    it 'appends link element for hub' 


    it 'appends link element for Salmon' 


    it 'appends stream entries' 

  end

  describe '#block_salmon' do
    include_examples 'namespaces' do
      def serialize
        block = Fabricate(:block)
        OStatus::AtomSerializer.new.block_salmon(block)
      end
    end

    it 'returns entry element' 


    it 'appends id element with unique tag' 


    it 'appends title element with description' 


    it 'appends author element with account' 


    it 'appends activity:object-type element with activity type' 


    it 'appends activity:verb element with block' 


    it 'appends activity:object element with target account' 


    it 'returns element whose rendered view triggers block when processed' 

  end

  describe '#unblock_salmon' do
    include_examples 'namespaces' do
      def serialize
        block = Fabricate(:block)
        OStatus::AtomSerializer.new.unblock_salmon(block)
      end
    end

    it 'returns entry element' 


    it 'appends id element with unique tag' 


    it 'appends title element with description' 


    it 'appends author element with account' 


    it 'appends activity:object-type element with activity type' 


    it 'appends activity:verb element with block' 


    it 'appends activity:object element with target account' 


    it 'returns element whose rendered view triggers block when processed' 

  end

  describe '#favourite_salmon' do
    include_examples 'namespaces' do
      def serialize
        favourite = Fabricate(:favourite)
        OStatus::AtomSerializer.new.favourite_salmon(favourite)
      end
    end

    it 'returns entry element' 


    it 'appends id element with unique tag' 


    it 'appends author element with account' 


    it 'appends activity:object-type element with activity type' 


    it 'appends activity:verb element with favorite' 


    it 'appends activity:object element with status' 


    it 'appends thr:in-reply-to element for status' 


    it 'includes description' 


    it 'returns element whose rendered view triggers favourite when processed' 

  end

  describe '#unfavourite_salmon' do
    include_examples 'namespaces' do
      def serialize
        favourite = Fabricate(:favourite)
        OStatus::AtomSerializer.new.favourite_salmon(favourite)
      end
    end

    it 'returns entry element' 


    it 'appends id element with unique tag' 


    it 'appends author element with account' 


    it 'appends activity:object-type element with activity type' 


    it 'appends activity:verb element with favorite' 


    it 'appends activity:object element with status' 


    it 'appends thr:in-reply-to element for status' 


    it 'includes description' 


    it 'returns element whose rendered view triggers unfavourite when processed' 

  end

  describe '#follow_salmon' do
    include_examples 'namespaces' do
      def serialize
        follow = Fabricate(:follow)
        OStatus::AtomSerializer.new.follow_salmon(follow)
      end
    end

    it 'returns entry element' 


    it 'appends id element with unique tag' 


    it 'appends author element with account' 


    it 'appends activity:object-type element with activity type' 


    it 'appends activity:verb element with follow' 


    it 'appends activity:object element with target account' 


    it 'includes description' 


    it 'returns element whose rendered view triggers follow when processed' 

  end

  describe '#unfollow_salmon' do
    include_examples 'namespaces' do
      def serialize
        follow = Fabricate(:follow)
        follow.destroy!
        OStatus::AtomSerializer.new.unfollow_salmon(follow)
      end
    end

    it 'returns entry element' 


    it 'appends id element with unique tag' 


    it 'appends title element with description' 


    it 'appends content element with description' 


    it 'appends author element with account' 


    it 'appends activity:object-type element with activity type' 


    it 'appends activity:verb element with follow' 


    it 'appends activity:object element with target account' 


    it 'returns element whose rendered view triggers unfollow when processed' 

  end

  describe '#follow_request_salmon' do
    include_examples 'namespaces' do
      def serialize
        follow_request = Fabricate(:follow_request)
        OStatus::AtomSerializer.new.follow_request_salmon(follow_request)
      end
    end

    context do
      def serialize(follow_request)
        OStatus::AtomSerializer.new.follow_request_salmon(follow_request)
      end

      it_behaves_like 'follow request salmon'

      it 'appends id element with unique tag' 


      it 'appends title element with description' 


      it 'returns element whose rendered view triggers follow request when processed' 

    end
  end

  describe '#authorize_follow_request_salmon' do
    include_examples 'namespaces' do
      def serialize
        follow_request = Fabricate(:follow_request)
        OStatus::AtomSerializer.new.authorize_follow_request_salmon(follow_request)
      end
    end

    it_behaves_like 'follow request salmon' do
      def serialize(follow_request)
        authorize_follow_request_salmon = OStatus::AtomSerializer.new.authorize_follow_request_salmon(follow_request)
        authorize_follow_request_salmon.nodes.find { |node| node.name == 'activity:object' }
      end
    end

    it 'appends id element with unique tag' 


    it 'appends title element with description' 


    it 'appends activity:object-type element with activity type' 


    it 'appends activity:verb element with authorize' 


    it 'returns element whose rendered view creates follow from follow request when processed' 

  end

  describe '#reject_follow_request_salmon' do
    include_examples 'namespaces' do
      def serialize
        follow_request = Fabricate(:follow_request)
        OStatus::AtomSerializer.new.reject_follow_request_salmon(follow_request)
      end
    end

    it_behaves_like 'follow request salmon' do
      def serialize(follow_request)
        reject_follow_request_salmon = OStatus::AtomSerializer.new.reject_follow_request_salmon(follow_request)
        reject_follow_request_salmon.nodes.find { |node| node.name == 'activity:object' }
      end
    end

    it 'appends id element with unique tag' 


    it 'appends title element with description' 


    it 'appends activity:object-type element with activity type' 


    it 'appends activity:verb element with authorize' 


    it 'returns element whose rendered view deletes follow request when processed' 

  end

  describe '#object' do
    include_examples 'status attributes' do
      def serialize(status)
        OStatus::AtomSerializer.new.object(status)
      end
    end

    it 'returns activity:object element' 


    it 'appends id element with URL for status' 


    it 'appends published element with created date' 


    it 'appends updated element with updated date' 


    it 'appends title element with title' 


    it 'appends author element with account' 


    it 'appends activity:object-type element with object type' 


    it 'appends activity:verb element with verb' 


    it 'appends link element for an alternative' 


    it 'appends thr:in-reply-to element if it is a reply and thread is not nil' 


    it 'does not append thr:in-reply-to element if thread is nil' 


    it 'does not append ostatus:conversation element if conversation_id is nil' 


    it 'appends ostatus:conversation element if conversation_id is not nil' 

  end
end


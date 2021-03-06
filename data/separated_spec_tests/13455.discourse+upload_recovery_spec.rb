require 'rails_helper'
require_dependency "upload_recovery"

RSpec.describe UploadRecovery do
  let(:user) { Fabricate(:user) }

  let(:upload) do
    UploadCreator.new(
      file_from_fixtures("smallest.png"),
      "logo.png"
    ).create_for(user.id)
  end

  let(:upload2) do
    UploadCreator.new(
      file_from_fixtures("small.pdf", "pdf"),
      "some.pdf"
    ).create_for(user.id)
  end

  let(:post) do
    Fabricate(:post,
      raw: <<~SQL,
      ![logo.png](#{upload.short_url})
      SQL
      user: user
    ).tap(&:link_post_uploads)
  end

  let(:upload_recovery) { UploadRecovery.new }

  before do
    SiteSetting.authorized_extensions = 'png|pdf'
    SiteSetting.queue_jobs = false
  end

  after do
    [upload, upload2].each do |u|
      next if u
      public_path = "#{Discourse.store.public_dir}#{u.url}"

      [
        public_path,
        public_path.sub("uploads", "uploads/tombstone")
      ].each { |path| File.delete(path) if File.exists?(path) }
    end
  end

  describe '#recover' do
    describe 'when given an invalid sha1' do
      it 'should not do anything' 

    end

    it 'accepts a custom ActiveRecord relation' 


    describe 'for a missing attachment' do
      let(:post) do
        Fabricate(:post,
          raw: <<~SQL,
          <a class="attachment" href="#{upload2.url}">some.pdf</a>
          <a>blank</a>
          SQL
          user: user
        ).tap(&:link_post_uploads)
      end

      it 'should recover the attachment' 

    end

    it 'should recover uploads and attachments' 

  end

  describe "#recover_user_profile_backgrounds" do
    before do
      user.user_profile.update!(
        profile_background: upload.url,
        card_background: upload.url
      )
    end

    it "should recover the background uploads" 


    describe 'for a bad upload' do
      it 'should not update the urls' 

    end
  end
end


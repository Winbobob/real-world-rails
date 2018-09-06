require 'rails_helper'

describe ImportWorker do
  let(:project) { create :project }
  let(:importer) { ImportWorker.new }
  let(:import) { mock_model(Attachinary::File, fullpath: Rack::Test::UploadedFile.new(csv)) }

  before do
    allow(Project).to receive_message_chain(:friendly, :find).with(project.id).and_return(project)
    allow(project).to receive(:import) { import }
    importer.instance_eval do
      def set_cache(key, value)
        @cache ||= {}
        @cache.merge!(key => value)
      end

      def cache
        @cache
      end
    end
    I18n.locale = :en
  end

  context 'valid csv' do
    let(:user) { create :user, name: 'Test User', initials: 'TU' }
    let(:csv) { 'spec/fixtures/csv/stories.csv' }

    it 'must import from CSV and create the proper stories' 

  end

  context 'illegal csv' do
    let(:csv) { 'spec/fixtures/csv/stories_illegal.csv' }

    it 'must import from CSV and create the proper stories' 

  end

  context 'invalid csv' do
    let(:user) { create :user, name: 'Malcolm Locke', initials: 'ML' }
    let(:csv) { 'spec/fixtures/csv/stories_invalid.csv' }

    before { Timecop.freeze(Time.local(2016, 9, 2, 12, 0, 0)) }
    after { Timecop.return }

    it 'must import from CSV and create the proper stories' 

  end
end


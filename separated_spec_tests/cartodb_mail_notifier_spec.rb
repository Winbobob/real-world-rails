# encoding: UTF-8

require 'spec_helper_min'
require_relative '../../lib/importer/mail_notifier'
require_relative '../../../../spec/rspec_configuration.rb'
require          'active_support/core_ext' # Needed for string.blank?

describe CartoDB::Importer2::MailNotifier do

  START_TIME = 0

  before(:each) do
    @data_import = FactoryGirl.build(:data_import)
    @resque = mock
    @result = mock
    results = [@result]
    @mail_notifier = CartoDB::Importer2::MailNotifier.new(@data_import, results, @resque)
  end

  def set_import_duration duration
    @data_import.stubs(:created_at).once.returns(START_TIME)
    @data_import.stubs(:updated_at).once.returns(START_TIME + duration)
  end

  describe '#notify_if_needed' do

    it 'should send a mail if the import took more than MIN_IMPORT_TIME_TO_NOTIFY' 

  end

  describe '#should_notify?' do
    def stub_notifiable_data_import
      set_import_duration(CartoDB::Importer2::MailNotifier::MIN_IMPORT_TIME_TO_NOTIFY + 1)
      @data_import.stubs(:synchronization_id).once.returns(nil)
      @data_import.stubs(:stats).returns('[]')
      @data_import.stubs(:service_item_id).returns('filename.txt')
    end

    it 'should return true if the import took more than MIN_IMPORT_TIME_TO_NOTIFY and was not a sync' 


    it 'should return false if the import state is not finished' 


    it 'should return false if the import took less than MIN_IMPORT_TIME_TO_NOTIFY' 


    it 'should return false if it was a sync import' 

  end

  describe '#send!' do
    it 'should inconditionally send a mail to the user who triggered the import' 

  end

end


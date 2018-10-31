# frozen_string_literal: true

require 'rails_helper'

describe UserStatsImporter do
  let(:start_date) { 2.days.ago }
  let(:end_date)   { 1.day.ago }
  let(:importer)   { described_class.new(start_date, end_date) }
  let(:user1)      { create(:user) }
  let(:user2)      { create(:user) }

  context 'gathering results' do
    let(:file_set_page_views) {
      [OpenStruct.new(date: '20170815', pagePath: '/concern/parent/39955m9995/file_sets/fj67314220', pageviews: '0'),
       OpenStruct.new(date: '20170818', pagePath: '/concern/parent/39955m9995/file_sets/fj67314220', pageviews: '2'),
       OpenStruct.new(date: '20170822', pagePath: '/concern/parent/39955m9995/file_sets/fj67314220', pageviews: '0'),
       OpenStruct.new(date: '20170816', pagePath: '/concern/file_sets/nzs25x853x', pageviews: '1'),
       OpenStruct.new(date: '20170819', pagePath: '/concern/file_sets/nzs25x853x', pageviews: '1'),
       OpenStruct.new(date: '20170820', pagePath: '/concern/file_sets/nzs25x853x', pageviews: '1'),
       OpenStruct.new(date: '20170820', pagePath: '/concern/parent/19953wt99z/file_sets/4f4752g26g', pageviews: '5')]
    }

    let(:work_page_views) {
      [OpenStruct.new(date: '20170815', pagePath: '/concern/generic_works/39955m9995', pageviews: '1'),
       OpenStruct.new(date: '20170820', pagePath: '/concern/generic_works/39955m9995', pageviews: '3'),
       OpenStruct.new(date: '20170825', pagePath: '/concern/generic_works/39955m9995', pageviews: '1'),
       OpenStruct.new(date: '20170816', pagePath: '/concern/generic_works/1vh53wt10', pageviews: '4'),
       OpenStruct.new(date: '20170822', pagePath: '/concern/generic_works/1vh53wt10', pageviews: '5'),
       OpenStruct.new(date: '20170822', pagePath: '/concern/generic_works/not_found', pageviews: '1'),
       OpenStruct.new(date: '20170822', pagePath: '/concern/generic_works/gone_baby', pageviews: '1')]
    }

    let(:work_downloads) {
      [OpenStruct.new(eventCategory: 'Files', eventAction: 'Downloaded', eventLabel: '(not set)', date: '20170815', pagePath: '/downloads/3xs55m950', totalEvents: '1'),
       OpenStruct.new(eventCategory: 'Files', eventAction: 'Downloaded', eventLabel: '(not set)', date: '20170817', pagePath: '/downloads/3xs55m950', totalEvents: '1'),
       OpenStruct.new(eventCategory: 'Files', eventAction: 'Downloaded', eventLabel: '(not set)', date: '20170819', pagePath: '/downloads/3xs55m950', totalEvents: '1'),
       OpenStruct.new(eventCategory: 'Files', eventAction: 'Downloaded', eventLabel: '(not set)', date: '20170819', pagePath: '/downloads/3xs55m950?abc=123', totalEvents: '1')]
    }

    let(:file_set_downloads) {
      [OpenStruct.new(eventCategory: 'Files', eventAction: 'Downloaded', eventLabel: '(not set)', date: '20170817', pagePath: '/downloads/19953wt99z', totalEvents: '1'),
       OpenStruct.new(eventCategory: 'Files', eventAction: 'Downloaded', eventLabel: '(not set)', date: '20170820', pagePath: '/downloads/19953wt99z', totalEvents: '1')]
    }

    let(:generic_file_with_fileset) { GenericWork.new(id: '3xs55m950', depositor: user2.login) }

    let(:view_report) { instance_double GoogleAnalytics::ViewReport, work_page_views: work_page_views, file_set_page_views: file_set_page_views }
    let(:download_report) { instance_double GoogleAnalytics::DownloadReport, work_downloads: work_downloads, file_set_downloads: file_set_downloads }

    before do
      allow(importer).to receive(:view_report).and_return(view_report)
      allow(importer).to receive(:download_report).and_return(download_report)
      allow(generic_file_with_fileset).to receive(:file_sets).and_return([FileSet.new(id: '3xs55m950_file', depositor: user2.login)])
      allow(ActiveFedora::Base).to receive(:find).with('3xs55m950').twice.and_return(generic_file_with_fileset)
      allow(ActiveFedora::Base).to receive(:find).with('39955m9995').once.and_return(GenericWork.new(id: '39955m9995', depositor: user1.login))
      allow(ActiveFedora::Base).to receive(:find).with('1vh53wt10').once.and_return(GenericWork.new(id: '1vh53wt10', depositor: user2.login))
      allow(ActiveFedora::Base).to receive(:find).with('19953wt99z').once.and_return(FileSet.new(id: '19953wt99z', depositor: user1.login))
      allow(ActiveFedora::Base).to receive(:find).with('fj67314220').once.and_return(FileSet.new(id: 'fj67314220', depositor: user1.login))
      allow(ActiveFedora::Base).to receive(:find).with('nzs25x853x').once.and_return(FileSet.new(id: 'nzs25x853x', depositor: user2.login))
      allow(ActiveFedora::Base).to receive(:find).with('4f4752g26g').once.and_return(FileSet.new(id: '4f4752g26g', depositor: user1.login))
      allow(ActiveFedora::Base).to receive(:find).with('not_found').and_raise(ActiveFedora::ObjectNotFoundError)
      allow(ActiveFedora::Base).to receive(:find).with('gone_baby').and_raise(Ldp::Gone)
    end

    describe '#gather_view_stats' do
      it 'creates view entries in cache' 


      it 'updates existing view entries in cache' 

    end

    describe '#gather_download_stats' do
      it 'creates view entries in cache' 

    end
  end

  describe '#tally_user_results' do
    let(:user1_work) { create :work, depositor: user1.login }
    let(:user1_file_set) { create :file_set, user: user1 }

    context 'no statuses are available' do
      it 'creates no status records' 

    end

    context 'people have viewed and dowloaded the objects' do
      let(:user2_file_set) { create :file_set, user: user2 }
      let(:user2_work) { create :work, depositor: user2.login }
      let(:user1_work2) { create :work, depositor: user1.login }
      let(:user1_file_set2) { create :file_set, user: user1 }
      let(:results) { [UserStat.new(date: Date.parse('2017-08-15'), user_id: user1.id, work_views: 2, file_views: 5, file_downloads: 0)] }

      before do
        WorkViewStat.create(date: Date.parse('2017-08-15'), work_id: user1_work.id, user_id: user1.id, work_views: 2)
        WorkViewStat.create(date: Date.parse('2017-08-16'), work_id: user1_work.id, user_id: user1.id, work_views: 2)
        WorkViewStat.create(date: Date.parse('2017-08-15'), work_id: user2_work.id, user_id: user2.id, work_views: 1)
        WorkViewStat.create(date: Date.parse('2017-08-16'), work_id: user2_work.id, user_id: user1.id, work_views: 2)
        WorkViewStat.create(date: Date.parse('2017-08-15'), work_id: user1_work2.id, user_id: user1.id, work_views: 3)
        FileViewStat.create(date: Date.parse('2017-08-15'), file_id: user1_file_set2.id, user_id: user1.id, views: 25)
        FileViewStat.create(date: Date.parse('2017-08-15'), file_id: user1_file_set.id, user_id: user1.id, views: 5)
        FileViewStat.create(date: Date.parse('2017-08-15'), file_id: user2_file_set.id, user_id: user2.id, views: 3)
        FileDownloadStat.create(date: Date.parse('2017-08-16'), file_id: user1_file_set.id, user_id: user1.id, downloads: 6)
      end
      it 'creates view entries in user table' 

    end
  end

  describe '#import' do
    it 'runs the entire import process' 

  end
end


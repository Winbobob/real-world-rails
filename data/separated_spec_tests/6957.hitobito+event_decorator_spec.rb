# encoding: utf-8

#  Copyright (c) 2012-2013, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe EventDecorator, :draper_with_helpers do
  include Rails.application.routes.url_helpers


  let(:event) { events(:top_course) }
  subject { EventDecorator.new(event) }

  its(:labeled_link) { is_expected.to match(/SLK TOP\-007 Top/) }
  its(:labeled_link) { is_expected.to match(%r{<a href="/groups/#{event.group_ids.first}/events/#{event.id}">}) }

  its(:label_with_group) { is_expected.to eq('Top: Top Course (TOP-007)')}

  context 'typeahead label' do
    subject { EventDecorator.new(event).as_typeahead[:label] }
    it { is_expected.to eq "#{event} (#{event.groups.first})" }

    context 'multiple groups are joined and truncated' do
      before do event.groups += [groups(:top_group), groups(:bottom_layer_one), groups(:bottom_group_one_one),
                                 groups(:bottom_layer_two), groups(:bottom_group_two_one)] end

      it { is_expected.to eq "#{event} (Top, TopGroup, Bottom One...)" }
    end
  end

  describe '#dates' do

    before { event.dates.clear }

    it 'joins multiple dates' 


    context 'date objects'  do
      it 'start_at only' 


      it 'start and finish' 


      it 'start and finish on same day' 

    end

    context 'time objects' do
      it 'start_at only' 


      it 'start and finish' 


      it 'start and finish on same day, start time' 


      it 'start and finish on same day, finish time' 


      it 'start and finish on same day, both times' 

    end

    def add_date(date)
      %w[:start_at, :finish_at].each do |key|
        date[key] = parse(date[key]) if date.key?(key)
      end
      event.dates.build(date)
      event.save!
    end

    def parse(str)
      Time.zone.parse(str)
    end

  end

  context 'qualification infos' do
    context 'with qualifications and prolongations' do
      its(:issued_qualifications_info_for_leaders) do
        should == 'Vergibt die Qualifikation Super Lead (for Leaders) unmittelbar per 01.03.2012 (letztes Kursdatum).'
      end

      its(:issued_qualifications_info_for_participants) do
        should == 'Vergibt die Qualifikation Super Lead und verlängert existierende Qualifikationen Group Lead unmittelbar per 01.03.2012 (letztes Kursdatum).'
      end
    end

    context 'only with qualifications' do
      before { event.kind = event_kinds(:glk) }

      its(:issued_qualifications_info_for_leaders) do
        should == 'Vergibt die Qualifikation Group Lead (for Leaders) unmittelbar per 01.03.2012 (letztes Kursdatum).'
      end

      its(:issued_qualifications_info_for_participants) do
        should == 'Vergibt die Qualifikation Group Lead unmittelbar per 01.03.2012 (letztes Kursdatum).'
      end
    end

    context 'only with prolongations' do
      before { event.kind = event_kinds(:fk) }

      its(:issued_qualifications_info_for_leaders) do
        should == 'Verlängert existierende Qualifikationen Group Lead (for Leaders), Super Lead (for Leaders) unmittelbar per 01.03.2012 (letztes Kursdatum).'
      end

      its(:issued_qualifications_info_for_participants) do
        should == 'Verlängert existierende Qualifikationen Group Lead, Super Lead unmittelbar per 01.03.2012 (letztes Kursdatum).'
      end
    end

    context 'without qualifications and prolongations' do
      before { event.kind = event_kinds(:old) }

      its(:issued_qualifications_info_for_leaders) do
        should == ''
      end

      its(:issued_qualifications_info_for_participants) do
        should == ''
      end
    end
  end

  context 'external_application_link' do
    let(:group) { groups(:top_group) }
    subject { EventDecorator.new(event).external_application_link(group) }


    context 'event does not support external applications' do
      before { event.update_column(:external_applications, false) }

      it { is_expected.to eq 'nicht möglich' }
    end

    context 'event supports external applications' do
      before { event.update_column(:external_applications, true) }

      it { is_expected.to match(/public_event/) }
    end

  end

end


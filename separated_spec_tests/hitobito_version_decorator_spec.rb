# encoding: utf-8

#  Copyright (c) 2014 Pfadibewegung Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe PaperTrail::VersionDecorator, :draper_with_helpers, versioning: true do

  include Rails.application.routes.url_helpers

  let(:person)    { people(:top_leader) }
  let(:version)   { PaperTrail::Version.where(main_id: person.id).order(:created_at, :id).last }
  let(:decorator) { PaperTrail::VersionDecorator.new(version) }

  before { PaperTrail.whodunnit = nil }

  context '#header' do
    subject { decorator.header }

    context 'without current user' do
      before { update_attributes }
      it { is_expected.to match(/^\w+, \d+\. [\w|ä]+ \d{4}, \d{2}:\d{2} Uhr$/) }
    end

    context 'with current user' do
      before do
        PaperTrail.whodunnit = person.id.to_s
        update_attributes
      end

      it { is_expected.to match(/^\w+, \d+\. [\w|ä]+ \d{4}, \d{2}:\d{2} Uhr<br \/>von <a href=".+">#{person.to_s}<\/a>$/) }
    end
  end

  context '#author' do
    subject { decorator.author }

    context 'without current user' do
      before { update_attributes }
      it { is_expected.to be_nil }
    end

    context 'with current user' do
      before do
        PaperTrail.whodunnit = person.id.to_s
        update_attributes
      end

      context 'and permission to link' do
        it do
          expect(decorator.h).to receive(:can?).with(:show, person).and_return(true)
          is_expected.to match(/^<a href=".+">#{person.to_s}<\/a>$/)
        end
      end

      context 'and no permission to link' do
        it do
          expect(decorator.h).to receive(:can?).with(:show, person).and_return(false)
          is_expected.to eq(person.to_s)
        end
      end
    end
  end

  context '#changes' do

    subject { decorator.changes }

    context 'with attribute changes' do
      before { update_attributes }

      it { is_expected.to match(/<div>Ort wurde/) }
      it { is_expected.to match(/<div>PLZ wurde/) }
      it { is_expected.to match(/<div>Haupt-E-Mail wurde/) }
    end

    context 'with association changes' do
      before { Fabricate(:social_account, contactable: person, label: 'Foo', name: 'Bar') }

      it { is_expected.to match(/<div>Social Media/) }
    end
  end

  context '#attribute_change' do
    before { update_attributes }

    it 'contains from and to attributes' 


    it 'contains only from attribute' 


    it 'contains only to attribute' 


    it 'is empty without from and to ' 


    it 'escapes html' 


    it 'formats according to column info' 

  end

  context '#association_change' do
    subject { decorator.association_change }

    it 'builds create text' 


    it 'builds update text' 


    it 'builds destroy text' 


    it 'builds destroy text for non existing Role class' 

  end

  def update_attributes
    person.update_attributes!(town: 'Bern', zip_code: '3007', email: 'new@hito.example.com')
  end

end


require 'rails_helper'

describe ExportJob do
  let(:person) { FactoryGirl.create(:person) }

  describe '#perform' do
    context 'when requesting groups xml' do
      let!(:group) { FactoryGirl.create(:group, name: 'Foo') }

      before do
        subject.perform(Site.current, 'groups', 'xml', person.id)
      end

      it 'exports groups to an xml file' 

    end

    context 'when requesting groups csv' do
      let!(:group) { FactoryGirl.create(:group, name: 'Foo') }

      before do
        subject.perform(Site.current, 'groups', 'csv', person.id)
      end

      it 'exports groups to a csv file' 

    end

    context 'when requesting people xml' do
      before do
        subject.perform(Site.current, 'people', 'xml', person.id)
      end

      it 'exports people to an xml file' 

    end

    context 'when requesting people csv' do
      before do
        subject.perform(Site.current, 'people', 'csv', person.id)
      end

      it 'exports people to a csv file' 

    end
  end
end


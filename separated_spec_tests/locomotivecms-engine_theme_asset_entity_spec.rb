require 'spec_helper'

describe Locomotive::API::Entities::ThemeAssetEntity do

  before { Time.zone = ActiveSupport::TimeZone['Chicago'] }

  subject { described_class }

  it { is_expected.to represent(:content_type) }
  it { is_expected.to represent(:folder) }
  it { is_expected.to represent(:checksum) }

  context 'overrides' do

    let(:theme_asset) { create(:theme_asset, source: rack_theme_image('rails.png')) }

    subject { described_class.new(theme_asset) }

    let(:exposure) { subject.serializable_hash }

    describe 'raw_size' do
      it 'returns the raw size' 

    end

    describe 'local_path' do
      it 'returns the local path' 

    end

    describe 'url' do
      it 'returns the source URL' 

    end

    describe 'size' do
      it 'runs size through #number_to_human_size' 

    end

    describe 'updated_at' do
      it 'runs updated_at through #iso_timestamp' 

    end

  end

end


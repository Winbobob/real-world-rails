require 'rails_helper'

RSpec.describe 'Multisite SiteSettings', type: :multisite do
  let(:conn) { RailsMultisite::ConnectionManagement }

  before do
    @original_provider = SiteSetting.provider
    SiteSetting.provider = SiteSettings::DbProvider.new(SiteSetting)
  end

  after do
    ['default', 'second'].each do |db|
      conn.with_connection(db) { SiteSetting.where(name: 'default_locale').destroy_all }
    end

    SiteSetting.provider = @original_provider
  end

  describe '#default_locale' do
    it 'should return the right locale' 

  end
end


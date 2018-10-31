require 'rails_helper'

RSpec.describe 'Multisite SiteSettings', type: :multisite do
  let(:conn) { RailsMultisite::ConnectionManagement }

  def cache(name, namespace: true)
    DistributedCache.new(name, namespace: namespace)
  end

  context 'without namespace' do
    let(:cache1) { cache('test', namespace: false) }

    it 'does not leak state across multisite' 

  end
end


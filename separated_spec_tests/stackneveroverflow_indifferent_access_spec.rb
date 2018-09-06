require 'spec_helper'

describe Hashie::Extensions::Dash::IndifferentAccess do
  class TrashWithIndifferentAccess < Hashie::Trash
    include Hashie::Extensions::Dash::IndifferentAccess
    property :per_page, transform_with: ->(v) { v.to_i }
    property :total, from: :total_pages
  end

  class DashWithIndifferentAccess < Hashie::Dash
    include Hashie::Extensions::Dash::IndifferentAccess
    property :name
  end

  context 'when included in Trash' do
    let(:params) { { per_page: '1', total_pages: 2 } }
    subject { TrashWithIndifferentAccess.new(params) }

    it 'gets the expected behaviour' 

  end

  context 'when included in Dash' do
    let(:patch) { Hashie::Extensions::Dash::IndifferentAccess::ClassMethods }
    let(:dash_class) { Class.new(Hashie::Dash) }

    it 'extends with the patch once' 

  end

  context 'initialized with' do
    it 'string' 


    it 'key' 

  end

  it 'updates' 


  context 'initialized with both prefers last assignment' do
    it 'string, then symbol' 


    it 'symbol then string' 

  end
end


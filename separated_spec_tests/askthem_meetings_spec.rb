require 'spec_helper'
require File.expand_path("../features_helper.rb", __FILE__)

describe 'meeting' do

  describe '#index' do

    context 'state jurisdiction' do
      it 'returns none' 

    end

    context "local jurisdiction" do
      before :each do
        Metadatum.create(name: 'Philadelphia',
                         abbreviation: 'pa-philadelphia',
                         chambers: {} )
      end

      context 'when it has no meetings' do
        it 'returns none' 

      end

      context 'when it has meetings' do
        it 'returns them' 

      end
    end
  end

end


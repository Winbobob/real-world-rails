# encoding: utf-8

require_relative '../../../lib/carto/valid_table_name_proposer.rb'

module Carto
  describe ValidTableNameProposer do
    before(:all) do
      @valid_table_name_proposer = Carto::ValidTableNameProposer.new
    end

    let(:taken) { %w{table_m_nolo_es_co_bar_ table_m_nolo_es_co_bar_1 table_m_nolo_es_co_bar_3} }

    describe '#propose_valid_table_name' do
      it 'Regression for CDB-3446' 


      it 'sanitizes reserved words appending _t' 


      it 'should sanitize name' 


      it 'handles long titles properly' 


      it 'should remove disallowed starting characters' 


      it 'should find unused names' 


      it 'should find unused names when taken_names is specified' 


      it 'should propose valid names when no contendent is specified' 


      it 'should propose valid names when nil contendent is specified' 


      it 'should propose valid names when empty contendent is specified' 


      it 'should propose valid names when empty taken_names is specified' 

    end
  end
end


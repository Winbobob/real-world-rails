# encoding: utf-8

require_relative '../../../../lib/carto/db/sanitize.rb'

module Carto
  module DB
    module Sanitize
      describe '#sanitize_identifier' do
        it 'should prepend table_ to identifiers starting with numbers' 


        it 'should prepend table_ to identifiers starting with _' 


        it 'should strip whitespaces' 


        it 'should remove repated _' 


        it 'should convert to lowercase' 


        it 'should replace whitespaces with _' 


        it 'should replace disallowed characters with _' 


        it 'should do all together' 


        it 'should append _t to identifiers that are RESERVED_WORDS' 


        it 'should append _t to identifiers that are RESERVED_TABLE_NAMES' 


        it 'should append _t to identifiers that are SYSTEM_TABLE_NAMES' 

      end

      describe '#append_with_truncate_and_sanitize' do
        it 'should append when length is normal' 


        it 'should append when identifier is too long' 


        it 'should raise when suffix is too long' 

      end
    end
  end
end


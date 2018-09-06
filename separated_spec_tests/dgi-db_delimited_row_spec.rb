require 'spec_helper'

class DefaultRow < Genome::Importers::DelimitedRow
  attribute :column_1
  attribute :column_2
  attribute :column_3, Array
end

class CustomParser < Genome::Importers::DelimitedRow
  attribute :upcased_thing, String, parser: ->(x) { x.upcase }
end

class CustomDelimiter < Genome::Importers::DelimitedRow
  attribute :delimited_thing, Array, delimiter: '|'
end

describe Genome::Importers::DelimitedRow do

  it 'should define an accessor method for each attribute' 


  it 'should default to tab delimited rows' 


  it 'should throw an error if the column numbers do not match' 


  it 'should not drop trailing empty columns' 


  it 'should accept String or Array types, but no others' 


  it 'should accept a custom delimiter for Array columns' 


  it 'should allow a custom parser to be supplied' 


  it 'should strip trailing and leading whitespace by default' 


end




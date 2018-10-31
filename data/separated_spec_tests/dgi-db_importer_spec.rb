require 'spec_helper'

describe Genome::Importers::Importer do

  before :each do
    @importer = Genome::Importers::Importer.new({source_db_name: 'test'})
  end

  it 'should respond to creation method calls for each entity name' 


  it 'should return the id of the newly created entity as a uuid string when create_* is called' 


  it 'should de-duplicate identical entites' 


  it 'should allow for an id to be passed in without overidding it' 


  it 'should create a source from the passed in hash' 


  it 'should allow an existing source to be passed in' 


  it 'should save the created entities to the database when store is called' 


  it 'should link the created entities to the created source' 


end


require "spec_helper"

describe 'EOL Lib' do
  describe ': Setting site configurations' do
    before :all do
      EolConfig.connection.execute('TRUNCATE TABLE site_configuration_options')
      @only_in_db = 'ONLY_IN_DB'
      @only_in_db_instance = EolConfig.gen(parameter: @only_in_db, value: 'anything')
      @nil_only_in_db = 'NIL_ONLY_IN_DB'
      @nil_only_in_db_instance = EolConfig.gen(parameter: @nil_only_in_db, value: nil)
      
      @only_in_environment = 'ONLY_IN_ENVIRONMENT'
      $ONLY_IN_ENVIRONMENT = 'some other value'
      @nil_only_in_environment = 'NIL_ONLY_IN_ENVIRONMENT'
      $NIL_ONLY_IN_ENVIRONMENT = nil
    end
    
    after :all do
      EolConfig.connection.execute('TRUNCATE TABLE site_configuration_options')
    end
    
    it 'should only accept variables with letters and underscores' 

    
    it 'should recognize variables defined in the database' 

    
    it 'should recognize variables defined in the code' 

    
    it 'should default to using the value in the environment' 

    
    it 'should be able to change or unset global variables' 

    
  end
end


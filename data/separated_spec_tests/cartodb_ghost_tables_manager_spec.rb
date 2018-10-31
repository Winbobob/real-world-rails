# encoding: utf-8

require_relative '../../spec_helper_min.rb'
require_relative '../../../lib/carto/ghost_tables_manager'

module Carto
  describe GhostTablesManager do
    before(:all) do
      @user = FactoryGirl.create(:carto_user)

      @ghost_tables_manager = Carto::GhostTablesManager.new(@user.id)
    end

    before(:each) do
      bypass_named_maps
      CartoDB::Logger.expects(:error).never
    end

    after(:all) do
      ::User[@user.id].destroy
    end

    def run_in_user_database(query)
      ::User[@user.id].in_database.run(query)
    end

    it 'should be consistent when no new/renamed/dropped tables' 


    it 'should not run sync when more than MAX_TABLES_FOR_SYNC_RUN need to be linked' 


    it 'should not run sync when more than MAX_TABLES_FOR_SYNC_RUN need to be linked including new tables' 


    it 'should run sync when more than 0 but less than MAX_TABLES_FOR_SYNC_RUN need to be linked' 


    it 'should not run sync when no tables are stale or dropped' 


    it 'should not run when no tables are changed with tables detected as raster and non-raster' 


    it 'should link sql created table, relink sql renamed tables and unlink sql dropped tables' 


    it 'should not link non cartodbyfied tables' 


    it 'should link raster tables' 


    it 'should regenerate user tables with bad table_ids' 


    it 'should preseve maps in drop create scenarios' 

  end
end


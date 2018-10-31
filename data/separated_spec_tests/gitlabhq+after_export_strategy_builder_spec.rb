require 'spec_helper'

describe Gitlab::ImportExport::AfterExportStrategyBuilder do
  let!(:strategies_namespace) { 'Gitlab::ImportExport::AfterExportStrategies' }

  describe '.build!' do
    context 'when klass param is' do
      it 'null it returns the default strategy' 


      it 'not a valid class it raises StrategyNotFoundError exception' 


      it 'not a descendant of AfterExportStrategy' 

    end

    it 'initializes strategy with attributes param' 

  end
end


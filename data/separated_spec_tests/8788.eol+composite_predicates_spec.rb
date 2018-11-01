require "spec_helper"

describe CompositePrimaryKeys::Predicates do

  let(:wrapper) do
    class MyModuleWrapper
      include CompositePrimaryKeys::Predicates
    end
    MyModuleWrapper.new
  end

  describe '#cpk_or_predicate' do

    it 'uses IN when possible' 


    it 'uses OR' 


  end

end


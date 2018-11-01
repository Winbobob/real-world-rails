require "spec_helper"

describe HierarchiesHelper do

  describe '#en_browsable_status' do

    before do
      @hierarchy = build_stubbed(Hierarchy)
      @hierarchy.stub(:browsable?) { false }
      @hierarchy.stub(:request_publish) { false }
    end

    it 'blank hierarchies are unknown' 


    it 'browsable hierarchies are browsable' 


    it 'request_publish hierarchies are request_publish' 


    it 'defaults to not_browsable' 


  end

end


require 'spec_helper'

describe Date do
  let(:friday) { Date.parse('2010-10-15') }
  let(:monday) { Date.parse('2010-10-18') }
  let(:tuesday) { Date.parse('2010-10-19') }

  context "when determining the previous working day" do

    it "has a prev_working_day method" 


    it "returns monday when run on a tuesday" 


    it "returns friday when run on a monday" 


  end

  context "when determining the next working day" do

    it "has a next_working_day method" 


    it "returns tuesday when run on a monday" 


    it "returns monday when run on a friday" 


  end

end


require 'rspec/core/formatters/helpers'

RSpec.describe RSpec::Core::Formatters::Helpers do
  helper = described_class

  describe "format duration" do
    context '< 1' do
      it "returns '0.xxxxx seconds' formatted string" 

    end

    context '> 1 and < 60' do
      it "returns 'xx.xx seconds' formatted string" 

    end

    context '> 60 and < 120' do
      it "returns 'x minute xx.xx seconds' formatted string" 

    end

    context '> 120 and < 300' do
      it "returns 'x minutes xx.x seconds' formatted string" 

    end

    context '> 300' do
      it "returns 'x minutes xx seconds' formatted string" 


      it "returns 'x minutes xx seconds' correctly on edgecase roundings" 

    end

    context '= 61' do
      it "returns 'x minute x second' formatted string" 

    end

    context '= 1' do
      it "returns 'x second' formatted string" 

    end

    context '= 70' do
      it "returns 'x minute, x0 seconds' formatted string" 

    end

    context 'with mathn loaded' do
      include MathnIntegrationSupport

      it "returns 'x minutes xx.x seconds' formatted string", :slow do
        with_mathn_loaded do
          expect(helper.format_duration(133.7)).to eq("2 minutes 13.7 seconds")
        end
      end
    end
  end

  describe "format seconds" do
    it "uses passed in precision if specified unless result is 0" 


    context "sub second times" do
      it "returns 5 digits of precision" 


      it "strips off trailing zeroes beyond sub-second precision" 


      context "0" do
        it "strips off trailing zeroes" 

      end

      context "> 1" do
        it "strips off trailing zeroes" 

      end

      context "70" do
        it "doesn't strip of meaningful trailing zeros" 

      end
    end

    context "second and greater times" do

      it "returns 2 digits of precision" 


      it "returns human friendly elasped time" 


    end
  end


end


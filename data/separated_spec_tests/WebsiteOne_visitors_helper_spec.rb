require 'spec_helper'

describe VisitorsHelper do
  describe '#display_countdown' do
    before :each do
      @default_tz = ENV['TZ']
      ENV['TZ'] = 'UTC'
    end

    after :each do
      Delorean.back_to_the_present
      ENV['TZ'] = @default_tz
    end

    it 'should display countdown based on input' 

    it 'should display countdown based on input and remove days when 0' 

  end

end


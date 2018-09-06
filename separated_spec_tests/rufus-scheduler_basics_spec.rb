
#
# Specifying rufus-scheduler
#
# Sun Jun  1 05:52:24 JST 2014
#

require 'spec_helper'


describe 'basics' do

  def tts(time)

    #time.strftime('%Y-%m-%d %H:%M:%S %z') + (time.dst? ? ' dst' : '')
    [
      time.strftime('%Y-%m-%d %H:%M:%S'),
      time.utc_offset.to_s,
      time.dst? ? 'dst' : ''
    ].select { |s| s.length > 0 }.join(' ')
  end

  describe 'Time.new' do

    it 'accepts a timezone final argument' 

  end

  describe 'Time.local' do

    it 'works as expected' 

  end
end



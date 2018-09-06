require 'spec_helper'

describe Listen::Adapters::Linux do
  if linux?
    if Listen::Adapters::Linux.usable?
      it "is usable on Linux" 


      it_should_behave_like 'a filesystem adapter'
      it_should_behave_like 'an adapter that call properly listener#on_change'

      describe '#initialize' do
        context 'when the inotify limit for watched files is not enough' do
          before { INotify::Notifier.any_instance.should_receive(:watch).and_raise(Errno::ENOSPC) }

          it 'fails gracefully' 

        end
      end
    else
      it "isn't usable on Linux with #{RbConfig::CONFIG['RUBY_INSTALL_NAME']}" 

    end
  end

  if bsd?
    it "isn't usable on BSD" 

  end

  if mac?
    it "isn't usable on Mac OS X" 

  end

  if windows?
    it "isn't usable on Windows" 

  end
end


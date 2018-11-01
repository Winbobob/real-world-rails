describe BackgroundThread do
  class TestClass
    include BackgroundThread
    def fiddle(stick, suffix)
      Rails.cache.write("fiddle_#{stick}", "#{self.class.name}-#{suffix}")
      return 'Not a future'
    end
    def time_bomb(seconds)
      bg_run do
        sleep seconds
        raise ArgumentError.new('Snark must not be Boojum')
      end
    end
  end

  subject { TestClass.new }

  it 'does not directly return if backgrounded' 


  it 'logs uncaught exceptions instead of silently dropping the task' 


end


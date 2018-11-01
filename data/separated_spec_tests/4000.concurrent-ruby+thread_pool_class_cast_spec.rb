module Concurrent

  RSpec.describe SingleThreadExecutor do
    if Concurrent.on_jruby?
      it 'inherits from JavaSingleThreadExecutor' 

    else
      it 'inherits from RubySingleThreadExecutor' 

    end
  end

  RSpec.describe ThreadPoolExecutor do
    if Concurrent.on_jruby?
      it 'inherits from JavaThreadPoolExecutor' 

    else
      it 'inherits from RubyThreadPoolExecutor' 

    end
  end
end


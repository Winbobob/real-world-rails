# Make test faster by not requiring Rails environment (spec_helper).
# In that case, we need to manually require the file we need.

require_relative '../../app/utils/context_runner'

describe ContextRunner do

  module EnterMW # :nodoc:
    def enter(ctx)
      enters = ctx[:enters] || []
      enters << name
      ctx[:enters] = enters
      ctx
    end
  end

  module LeaveMW # :nodoc:
    def leave(ctx)
      leaves = ctx[:leaves] || []
      leaves << name
      ctx[:leaves] = leaves
      ctx
    end
  end

  module ErrorRaiseMW # :nodoc:
    def error(ctx)
      errors = ctx[:errors] || []
      errors << name
      ctx[:errors] = errors
      ctx
    end
  end

  module ErrorResolveMW # :nodoc:
    def error(ctx)
      errors = ctx[:errors] || []
      errors << name
      ctx[:errors] = errors
      ctx[:error] = nil
      ctx
    end
  end

  module EnterRaiseMW # :nodoc:
    def enter(ctx)
      raise StandardError.new("middleware enter failed")
    end
  end

  module LeaveRaiseMW # :nodoc
    def leave(ctx)
      raise StandardError.new("middleware leave failed")
    end
  end

  class TestMiddlewareEL # :nodoc:
    include EnterMW
    include LeaveMW

    attr_reader :name
    def initialize(name)
      @name = name
    end
  end

  class TestMiddlewareE # :nodoc:
    include EnterMW

    attr_reader :name
    def initialize(name)
      @name = name
    end
  end

  class TestMiddlewareL # :nodoc:
    include LeaveMW

    attr_reader :name
    def initialize(name)
      @name = name
    end
  end

  class TestMiddlewareELERaise
    include EnterMW
    include LeaveMW
    include ErrorRaiseMW

    attr_reader :name
    def initialize(name)
      @name = name
    end
  end

  class TestMiddlewareRaise
    include EnterRaiseMW
  end

  class TestMiddlewareELEResolve
    include EnterMW
    include LeaveMW
    include ErrorResolveMW

    attr_reader :name
    def initialize(name)
      @name = name
    end
  end

  class TestMiddlewareELRaise
    include EnterMW
    include LeaveRaiseMW

    attr_reader :name
    def initialize(name)
      @name = name
    end
  end


  it 'exists' 


  it 'executes enter and leave phases of middleware' 


  it 'executes enters in given orders and leaves in reverse' 


  it 'calls enter and leave only on middleware that define them' 


  it 'calls error on all middlewares in stack' 


  it 'middleware can resolve an error which leads to remaining leaves being called' 


  it 'leave raising trigger the error flow' 

end


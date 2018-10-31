require 'spec_helper'

describe ContinueParams do
  let(:controller_class) do
    Class.new(ActionController::Base) do
      include ContinueParams

      def request
        @request ||= Struct.new(:host, :port).new('test.host', 80)
      end
    end
  end
  subject(:controller) { controller_class.new }

  def strong_continue_params(params)
    ActionController::Parameters.new(continue: params)
  end

  it 'cleans up any params that are not allowed' 


  it 'does not allow cross host redirection' 


  it 'allows redirecting to a path with querystring' 

end


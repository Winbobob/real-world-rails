require 'helper'

def make_env(path = '/auth/test', props = {})
  {
    'REQUEST_METHOD' => 'GET',
    'PATH_INFO' => path,
    'rack.session' => {},
    'rack.input' => StringIO.new('test=true')
  }.merge(props)
end

describe OmniAuth::Strategy do
  let(:app) do
    lambda { |_env| [404, {}, ['Awesome']] }
  end

  let(:fresh_strategy) do
    c = Class.new
    c.send(:include, OmniAuth::Strategy)
  end

  describe '.default_options' do
    it 'is inherited from a parent class' 

  end

  describe '.configure' do
    subject do
      c = Class.new
      c.send(:include, OmniAuth::Strategy)
    end

    context 'when block is passed' do
      it 'allows for default options setting' 


      it "works when block doesn't evaluate to true" 

    end

    it 'takes a hash and deep merge it' 

  end

  describe '#skip_info?' do
    it 'is true if options.skip_info is true' 


    it 'is false if options.skip_info is false' 


    it 'is false by default' 


    it 'is true if options.skip_info is a callable that evaluates to truthy' 

  end

  describe '.option' do
    subject do
      c = Class.new
      c.send(:include, OmniAuth::Strategy)
    end
    it 'sets a default value' 


    it 'sets the default value to nil if none is provided' 

  end

  describe '.args' do
    subject do
      c = Class.new
      c.send(:include, OmniAuth::Strategy)
    end

    it 'sets args to the specified argument if there is one' 


    it 'is inheritable' 


    it 'accepts corresponding options as default arg values' 

  end

  context 'fetcher procs' do
    subject { fresh_strategy }
    %w[uid info credentials extra].each do |fetcher|
      describe ".#{fetcher}" do
        it 'sets and retrieve a proc' 

      end
    end
  end

  context 'fetcher stacks' do
    subject { fresh_strategy }
    %w[uid info credentials extra].each do |fetcher|
      describe ".#{fetcher}_stack" do
        it 'is an array of called ancestral procs' 

      end
    end
  end

  %w[request_phase].each do |abstract_method|
    context abstract_method.to_s do
      it 'raises a NotImplementedError' 

    end
  end

  describe '#auth_hash' do
    subject do
      klass = Class.new
      klass.send :include, OmniAuth::Strategy
      klass.option :name, 'auth_hasher'
      klass
    end
    let(:instance) { subject.new(app) }

    it 'calls through to uid and info' 


    it 'returns an AuthHash' 

  end

  describe '#initialize' do
    context 'options extraction' do
      it 'is the last argument if the last argument is a Hash' 


      it 'is the default options if any are provided' 

    end

    context 'custom args' do
      subject do
        c = Class.new
        c.send(:include, OmniAuth::Strategy)
      end

      it 'sets options based on the arguments if they are supplied' 

    end
  end

  describe '#call' do
    it 'duplicates and calls' 


    it 'raises NoSessionError if rack.session isn\'t set' 

  end

  describe '#inspect' do
    it 'returns the class name' 

  end

  describe '#redirect' do
    it 'uses javascript if :iframe is true' 

  end

  describe '#callback_phase' do
    subject do
      c = Class.new
      c.send(:include, OmniAuth::Strategy)
      c.new(app)
    end

    it 'sets the auth hash' 

  end

  describe '#full_host' do
    let(:strategy) { ExampleStrategy.new(app, {}) }
    it 'remains calm when there is a pipe in the URL' 

  end

  describe '#uid' do
    subject { fresh_strategy }
    it "is the current class's uid if one exists" 


    it 'inherits if it can' 

  end

  %w[info credentials extra].each do |fetcher|
    subject { fresh_strategy }
    it "is the current class's proc call if one exists" 


    it 'inherits by merging with preference for the latest class' 

  end

  describe '#call' do
    before(:all) do
      @options = nil
    end

    let(:strategy) { ExampleStrategy.new(app, @options || {}) }

    context 'omniauth.origin' do
      context 'disabled' do
        it 'does not set omniauth.origin' 

      end

      context 'custom' do
        it 'sets from a custom param' 

      end

      context 'default flow' do
        it 'is set on the request phase' 


        it 'is turned into an env variable on the callback phase' 


        it 'sets from the params if provided' 


        it 'is set on the failure env' 


        context 'with script_name' do
          it 'is set on the request phase, containing full path' 


          it 'is turned into an env variable on the callback phase, containing full path' 

        end
      end
    end

    context 'default paths' do
      it 'uses the default request path' 


      it 'is case insensitive on request path' 


      it 'is case insensitive on callback path' 


      it 'uses the default callback path' 


      it 'strips trailing spaces on request' 


      it 'strips trailing spaces on callback' 


      context 'callback_url' do
        it 'uses the default callback_path' 


        it 'preserves the query parameters' 


        it 'consider script name' 

      end
    end

    context ':form option' do
      it 'calls through to the supplied form option if one exists' 


      it 'calls through to the app if :form => true is set as an option' 

    end

    context 'dynamic paths' do
      it 'runs the request phase if the custom request path evaluator is truthy' 


      it 'runs the callback phase if the custom callback path evaluator is truthy' 


      it 'provides a custom callback path if request_path evals to a string' 


      it 'correctly reports the callback path when the custom callback path evaluator is truthy' 

    end

    context 'custom paths' do
      it 'uses a custom request_path if one is provided' 


      it 'uses a custom callback_path if one is provided' 


      context 'callback_url' do
        it 'uses a custom callback_path if one is provided' 


        it 'preserves the query parameters' 

      end
    end

    context 'custom prefix' do
      before do
        @options = {:path_prefix => '/wowzers'}
      end

      it 'uses a custom prefix for request' 


      it 'uses a custom prefix for callback' 


      context 'callback_url' do
        it 'uses a custom prefix' 


        it 'preserves the query parameters' 

      end
    end

    context 'request method restriction' do
      before do
        OmniAuth.config.allowed_request_methods = [:post]
      end

      it 'does not allow a request method of the wrong type' 


      it 'allows a request method of the correct type' 


      after do
        OmniAuth.config.allowed_request_methods = %i[get post]
      end
    end

    context 'receiving an OPTIONS request' do
      shared_examples_for 'an OPTIONS request' do
        it 'responds with 200' 


        it 'sets the Allow header properly' 

      end

      context 'to the request path' do
        let(:response) { strategy.call(make_env('/auth/test', 'REQUEST_METHOD' => 'OPTIONS')) }
        it_behaves_like 'an OPTIONS request'
      end

      context 'to the request path' do
        let(:response) { strategy.call(make_env('/auth/test/callback', 'REQUEST_METHOD' => 'OPTIONS')) }
        it_behaves_like 'an OPTIONS request'
      end

      context 'to some other path' do
        it 'does not short-circuit the request' 

      end
    end

    context 'options mutation' do
      before do
        @options = {:dup => true}
      end

      context 'in request phase' do
        it 'does not affect original options' 


        it 'does not affect deep options' 

      end

      context 'in callback phase' do
        it 'does not affect original options' 


        it 'does not affect deep options' 

      end
    end

    context 'test mode' do
      let(:app) do
        # In test mode, the underlying app shouldn't be called on request phase.
        lambda { |_env| [404, {'Content-Type' => 'text/html'}, []] }
      end

      before do
        OmniAuth.config.test_mode = true
      end

      it 'short circuits the request phase entirely' 


      it "doesn't short circuit the request if request method is not allowed" 


      it 'is case insensitive on request path' 


      it 'respects SCRIPT_NAME (a.k.a. BaseURI)' 


      it 'redirects on failure' 


      it 'respects SCRIPT_NAME (a.k.a. BaseURI) on failure' 


      it 'is case insensitive on callback path' 


      it 'maintains host and port' 


      it 'maintains query string parameters' 


      it 'does not short circuit requests outside of authentication' 


      it 'responds with the default hash if none is set' 


      it 'responds with a provider-specific hash if one is set' 


      it 'simulates login failure if mocked data is set as a symbol' 


      context 'omniauth.origin' do
        context 'disabled' do
          it 'does not set omniauth.origin' 

        end

        context 'default flow' do
          it 'sets omniauth.origin to the HTTP_REFERER on the request phase by default' 


          it 'sets omniauth.origin from the params if provided' 

        end

        context 'custom' do
          it 'sets omniauth.origin from a custom param' 

        end
      end

      it 'turns omniauth.origin into an env variable on the callback phase' 


      it 'executes callback hook on the callback phase' 


      it 'sets omniauth.params with query params on the request phase' 


      it 'does not set body parameters of POST request on the request phase' 


      it 'executes request hook on the request phase' 


      it 'turns omniauth.params into an env variable on the callback phase' 


      after do
        OmniAuth.config.test_mode = false
      end
    end

    context 'custom full_host' do
      before do
        OmniAuth.config.test_mode = true
      end

      it 'is the string when a string is there' 


      it 'runs the proc with the env when it is a proc' 


      it "is based on the request if it's not a string nor a proc" 


      it 'honors HTTP_X_FORWARDED_PROTO if present' 


      after do
        OmniAuth.config.full_host = nil
        OmniAuth.config.test_mode = false
      end
    end
  end

  context 'setup phase' do
    before do
      OmniAuth.config.test_mode = true
    end

    context 'when options[:setup] = true' do
      let(:strategy) do
        ExampleStrategy.new(app, :setup => true)
      end

      let(:app) do
        lambda do |env|
          env['omniauth.strategy'].options[:awesome] = 'sauce' if env['PATH_INFO'] == '/auth/test/setup'
          [404, {}, 'Awesome']
        end
      end

      it 'calls through to /auth/:provider/setup' 


      it 'does not call through on a non-omniauth endpoint' 

    end

    context 'when options[:setup] is an app' do
      let(:setup_proc) do
        proc do |env|
          env['omniauth.strategy'].options[:awesome] = 'sauce'
        end
      end

      let(:strategy) { ExampleStrategy.new(app, :setup => setup_proc) }

      it 'does not call the app on a non-omniauth endpoint' 


      it 'calls the rack app' 

    end

    after do
      OmniAuth.config.test_mode = false
    end
  end
end


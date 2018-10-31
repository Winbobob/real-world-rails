describe BacktraceDecorator, type: :decorator do
  let(:backtrace) do
    described_class.new(
      Backtrace.new(
        lines: [
          { number: 131,
            file:   '[PROJECT_ROOT]app/controllers/accounts_controller.rb',
            method: :update_preferences },
          { number: 61,
            file:   '[PROJECT_ROOT]app/controllers/application_controller.rb',
            method: :call },
          { number: 182,
            file:   '[GEM_ROOT]activesupport-2.3.18/lib/active_support/callbacks.rb',
            method: :call },
          { number: 384,
            file:   '[PROJECT_ROOT]app/models/account.rb',
            method: :update_server_tag_scope },
          { number: 182,
            file:   '[GEM_ROOT]activesupport-2.3.18/lib/active_support/callbacks.rb',
            method: :evaluate_method },
          { number: 23,
            file:   '/home/rails/library/current/vendor/bundle/ruby/2.1.0/bin/rainbows',
            method: '<main>' }
        ]
      )
    )
  end

  describe '#grouped_lines' do
    let(:grouped) { backtrace.grouped_lines.to_a }

    it 'puts the first two in-app lines in separate groups' 


    it 'puts the first out-of-app line in its own group' 


    it 'puts the last two out-of-app lines together in one group' 

  end

  describe '#lines' do
    context 'when empty' do
      let(:backtrace) { described_class.new(Backtrace.new) }

      it 'does not raise an NoMethodError' 

    end
  end
end


# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::FrozenStringLiteralComment, :config do
  subject(:cop) { described_class.new(config) }

  context 'always' do
    let(:cop_config) do
      { 'Enabled' => true,
        'EnforcedStyle' => 'always' }
    end

    it 'accepts an empty source' 


    it 'accepts a source with no tokens' 


    it 'accepts a frozen string literal on the top line' 


    it 'accepts a disabled frozen string literal on the top line' 


    it 'registers an offense for not having a frozen string literal comment ' \
       'on the top line' do
      expect_offense(<<-RUBY.strip_indent)
        puts 1
        ^ Missing magic comment `# frozen_string_literal: true`.
      RUBY
    end

    it 'registers an offense for not having a frozen string literal comment ' \
       'under a shebang' do
      expect_offense(<<-RUBY.strip_indent)
        #!/usr/bin/env ruby
        ^ Missing magic comment `# frozen_string_literal: true`.
        puts 1
      RUBY
    end

    it 'accepts a frozen string literal below a shebang comment' 


    it 'accepts a disabled frozen string literal below a shebang comment' 


    it 'registers an offense for not having a frozen string literal comment ' \
       'under an encoding comment' do
      expect_offense(<<-RUBY.strip_indent)
        # encoding: utf-8
        ^ Missing magic comment `# frozen_string_literal: true`.
        puts 1
      RUBY
    end

    it 'accepts a frozen string literal below an encoding comment' 


    it 'accepts a dsabled frozen string literal below an encoding comment' 


    it 'registers an offense for not having a frozen string literal comment ' \
       'under a shebang and an encoding comment' do
      expect_offense(<<-RUBY.strip_indent)
        #!/usr/bin/env ruby
        ^ Missing magic comment `# frozen_string_literal: true`.
        # encoding: utf-8
        puts 1
      RUBY
    end

    it 'accepts a frozen string literal comment below shebang and encoding ' \
       'comments' do
      expect_no_offenses(<<-RUBY.strip_indent)
        #!/usr/bin/env ruby
        # encoding: utf-8
        # frozen_string_literal: true
        puts 1
      RUBY
    end

    it 'accepts a disabled frozen string literal comment below shebang and ' \
       'encoding comments' do
      expect_no_offenses(<<-RUBY.strip_indent)
        #!/usr/bin/env ruby
        # encoding: utf-8
        # frozen_string_literal: false
        puts 1
      RUBY
    end

    it 'accepts a frozen string literal comment below shebang above an ' \
       'encoding comments' do
      expect_no_offenses(<<-RUBY.strip_indent)
        #!/usr/bin/env ruby
        # frozen_string_literal: true
        # encoding: utf-8
        puts 1
      RUBY
    end

    it 'accepts a disabled frozen string literal comment below shebang above ' \
       'an encoding comments' do
      expect_no_offenses(<<-RUBY.strip_indent)
        #!/usr/bin/env ruby
        # frozen_string_literal: false
        # encoding: utf-8
        puts 1
      RUBY
    end

    it 'accepts an emacs style combined magic comment' 


    context 'auto-correct' do
      it 'adds a frozen string literal comment to the first line if one is ' \
         'missing' do
        new_source = autocorrect_source(<<-RUBY.strip_indent)
          puts 1
        RUBY

        expect(new_source).to eq(<<-RUBY.strip_indent)
          # frozen_string_literal: true

          puts 1
        RUBY
      end

      it 'adds a frozen string literal comment to the first line if one is ' \
         'missing and handles extra spacing' do
        new_source = autocorrect_source(<<-RUBY.strip_indent)

          puts 1
        RUBY

        expect(new_source).to eq(<<-RUBY.strip_indent)
          # frozen_string_literal: true

          puts 1
        RUBY
      end

      it 'adds a frozen string literal comment after a shebang' 


      it 'adds a frozen string literal comment after an encoding comment' 


      it 'adds a frozen string literal comment after a shebang and encoding ' \
         'comment' do
        new_source = autocorrect_source(<<-RUBY.strip_indent)
          #!/usr/bin/env ruby
          # encoding: utf-8
          puts 1
        RUBY

        expect(new_source).to eq(<<-RUBY.strip_indent)
          #!/usr/bin/env ruby
          # encoding: utf-8
          # frozen_string_literal: true

          puts 1
        RUBY
      end

      it 'adds a frozen string literal comment after a shebang and encoding ' \
         'comment when there is an empty line before the code' do
        new_source = autocorrect_source(<<-RUBY.strip_indent)
          #!/usr/bin/env ruby
          # encoding: utf-8

          puts 1
        RUBY

        expect(new_source).to eq(<<-RUBY.strip_indent)
          #!/usr/bin/env ruby
          # encoding: utf-8
          # frozen_string_literal: true

          puts 1
        RUBY
      end

      it 'adds a frozen string literal comment after an encoding comment ' \
         'when there is an empty line before the code' do
        new_source = autocorrect_source(<<-RUBY.strip_indent)
          # encoding: utf-8

          puts 1
        RUBY

        expect(new_source).to eq(<<-RUBY.strip_indent)
          # encoding: utf-8
          # frozen_string_literal: true

          puts 1
        RUBY
      end
    end
  end

  context 'when_needed' do
    let(:cop_config) do
      { 'Enabled' => true,
        'EnforcedStyle' => 'when_needed' }
    end

    it 'accepts an empty source' 


    if RUBY_VERSION >= '2.3.0'
      context 'ruby >= 2.3' do
        context 'no frozen string literal comment' do
          it 'accepts not modifing a string' 


          it 'accepts calling + on a string' 


          it 'accepts calling freeze on a variable' 


          it 'accepts calling shovel on a variable' 


          it 'accepts freezing a string' 


          it 'accepts when << is called on a string literal' 

        end

        it 'accepts freezing a string when there is a frozen string literal ' \
           'comment' do
          expect_no_offenses(<<-RUBY.strip_indent)
            # frozen_string_literal: true
            "x".freeze
          RUBY
        end

        it 'accepts shoveling into a string when there is a frozen string ' \
           'literal comment' do
          expect_no_offenses(<<-RUBY.strip_indent)
            # frozen_string_literal: true
            "x" << "y"
          RUBY
        end
      end
    end

    context 'target_ruby_version < 2.3', :ruby22 do
      it 'accepts freezing a string' 


      it 'accepts calling << on a string' 


      it 'accepts freezing a string with interpolation' 


      it 'accepts calling << on a string with interpolation' 

    end

    context 'target_ruby_version 2.3+', :ruby23 do
      it 'accepts freezing a string' 


      it 'accepts calling << on a string' 


      it 'accepts freezing a string with interpolation' 


      it 'accepts calling << on a string with interpolation' 

    end
  end

  context 'never' do
    let(:cop_config) do
      { 'Enabled' => true,
        'EnforcedStyle' => 'never' }
    end

    it 'accepts an empty source' 


    it 'accepts a source with no tokens' 


    it 'registers an offense for a frozen string literal comment ' \
      'on the top line' do
      expect_offense(<<-RUBY.strip_indent)
        # frozen_string_literal: true
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ Unnecessary frozen string literal comment.
        puts 1
      RUBY
    end

    it 'registers an offense for a disabled frozen string literal comment ' \
      'on the top line' do
      expect_offense(<<-RUBY.strip_indent)
        # frozen_string_literal: false
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ Unnecessary frozen string literal comment.
        puts 1
      RUBY
    end

    it 'accepts not having a frozen string literal comment on the top line' 


    it 'accepts not having not having a frozen string literal comment ' \
      'under a shebang' do
      expect_no_offenses(<<-RUBY.strip_indent)
        #!/usr/bin/env ruby
        puts 1
      RUBY
    end

    it 'registers an offense for a frozen string literal comment ' \
      'below a shebang comment' do
      expect_offense(<<-RUBY.strip_indent)
        #!/usr/bin/env ruby
        # frozen_string_literal: true
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ Unnecessary frozen string literal comment.
        puts 1
      RUBY
    end

    it 'registers an offense for a disabled frozen string literal ' \
      'below a shebang comment' do
      expect_offense(<<-RUBY.strip_indent)
        #!/usr/bin/env ruby
        # frozen_string_literal: false
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ Unnecessary frozen string literal comment.
        puts 1
      RUBY
    end

    it 'allows not having a frozen string literal comment ' \
      'under an encoding comment' do
      expect_no_offenses(<<-RUBY.strip_indent)
        # encoding: utf-8
        puts 1
      RUBY
    end

    it 'registers an offense for a frozen string literal comment below ' \
      'an encoding comment' do
      expect_offense(<<-RUBY.strip_indent)
        # encoding: utf-8
        # frozen_string_literal: true
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ Unnecessary frozen string literal comment.
        puts 1
      RUBY
    end

    it 'registers an offense for a dsabled frozen string literal below ' \
      'an encoding comment' do
      expect_offense(<<-RUBY.strip_indent)
        # encoding: utf-8
        # frozen_string_literal: false
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ Unnecessary frozen string literal comment.
        puts 1
      RUBY
    end

    it 'allows not having a frozen string literal comment ' \
      'under a shebang and an encoding comment' do
      expect_no_offenses(<<-RUBY.strip_indent)
        #!/usr/bin/env ruby
        # encoding: utf-8
        puts 1
      RUBY
    end

    it 'registers an offense for a frozen string literal comment ' \
      'below shebang and encoding comments' do
      expect_offense(<<-RUBY.strip_indent)
        #!/usr/bin/env ruby
        # encoding: utf-8
        # frozen_string_literal: true
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ Unnecessary frozen string literal comment.
        puts 1
      RUBY
    end

    it 'registers an offense for a disabled frozen string literal comment ' \
      'below shebang and encoding comments' do
      expect_offense(<<-RUBY.strip_indent)
        #!/usr/bin/env ruby
        # encoding: utf-8
        # frozen_string_literal: false
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ Unnecessary frozen string literal comment.
        puts 1
      RUBY
    end

    it 'registers an offense for a frozen string literal comment ' \
      'below shebang above an encoding comments' do
      expect_offense(<<-RUBY.strip_indent)
        #!/usr/bin/env ruby
        # frozen_string_literal: true
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ Unnecessary frozen string literal comment.
        # encoding: utf-8
        puts 1
      RUBY
    end

    it 'registers an offense for a disabled frozen string literal comment ' \
      'below shebang above an encoding comments' do
      expect_offense(<<-RUBY.strip_indent)
        #!/usr/bin/env ruby
        # frozen_string_literal: false
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ Unnecessary frozen string literal comment.
        # encoding: utf-8
        puts 1
      RUBY
    end

    context 'auto-correct' do
      it 'removes the frozen string literal comment from the top line' 


      it 'removes a disabled frozen string literal comment on the top line' 


      it 'removes a frozen string literal comment below a shebang comment' 


      it 'removes a disabled frozen string literal below a shebang comment' 


      it 'removes a frozen string literal comment below an encoding comment' 


      it 'removes a dsabled frozen string literal below an encoding comment' 


      it 'removes a frozen string literal comment ' \
        'below shebang and encoding comments' do
        new_source = autocorrect_source(<<-RUBY.strip_indent)
          #!/usr/bin/env ruby
          # encoding: utf-8
          # frozen_string_literal: true
          puts 1
        RUBY

        expect(new_source).to eq(<<-RUBY.strip_indent)
          #!/usr/bin/env ruby
          # encoding: utf-8
          puts 1
        RUBY
      end

      it 'removes a disabled frozen string literal comment from ' \
        'below shebang and encoding comments' do
        new_source = autocorrect_source(<<-RUBY.strip_indent)
          #!/usr/bin/env ruby
          # encoding: utf-8
          # frozen_string_literal: false
          puts 1
        RUBY

        expect(new_source).to eq(<<-RUBY.strip_indent)
          #!/usr/bin/env ruby
          # encoding: utf-8
          puts 1
        RUBY
      end

      it 'removes a frozen string literal comment ' \
        'below shebang above an encoding comments' do
        new_source = autocorrect_source(<<-RUBY.strip_indent)
          #!/usr/bin/env ruby
          # frozen_string_literal: true
          # encoding: utf-8
          puts 1
        RUBY

        expect(new_source).to eq(<<-RUBY.strip_indent)
          #!/usr/bin/env ruby
          # encoding: utf-8
          puts 1
        RUBY
      end

      it 'removes a disabled frozen string literal comment ' \
        'below shebang above an encoding comments' do
        new_source = autocorrect_source(<<-RUBY.strip_indent)
          #!/usr/bin/env ruby
          # frozen_string_literal: false
          # encoding: utf-8
          puts 1
        RUBY

        expect(new_source).to eq(<<-RUBY.strip_indent)
          #!/usr/bin/env ruby
          # encoding: utf-8
          puts 1
        RUBY
      end
    end
  end
end


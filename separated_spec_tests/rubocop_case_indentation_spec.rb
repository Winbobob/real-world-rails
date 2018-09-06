# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Layout::CaseIndentation do
  subject(:cop) { described_class.new(config) }

  let(:config) do
    merged = RuboCop::ConfigLoader
             .default_configuration['Layout/CaseIndentation'].merge(cop_config)
    RuboCop::Config.new('Layout/CaseIndentation' => merged,
                        'Layout/IndentationWidth' => { 'Width' => 2 })
  end

  context 'with EnforcedStyle: case' do
    context 'with IndentOneStep: false' do
      let(:cop_config) do
        { 'EnforcedStyle' => 'case', 'IndentOneStep' => false }
      end

      context 'with everything on a single line' do
        it 'does not register an offense' 

      end

      context 'regarding assignment where the right hand side is a case' do
        let(:correct_source) do
          <<-RUBY.strip_indent
            output = case variable
                     when 'value1'
              'output1'
            else
              'output2'
            end
          RUBY
        end

        it 'accepts a correctly indented assignment' 


        context 'an assignment indented as end' do
          let(:source) do
            <<-RUBY.strip_indent
              output = case variable
              when 'value1'
                'output1'
              else
                'output2'
              end
            RUBY
          end

          it 'registers an offense' 


          it 'does auto-correction' 

        end

        context 'an assignment indented some other way' do
          let(:source) do
            <<-RUBY.strip_indent
              output = case variable
                when 'value1'
                  'output1'
                else
                  'output2'
              end
            RUBY
          end

          let(:correct_source) do
            <<-RUBY.strip_indent
              output = case variable
                       when 'value1'
                  'output1'
                else
                  'output2'
              end
            RUBY
          end

          it 'registers an offense' 


          it 'does auto-correction' 

        end

        context 'correct + opposite' do
          let(:source) do
            <<-RUBY.strip_indent
              output = case variable
                       when 'value1'
                         'output1'
                       else
                         'output2'
                       end
              output = case variable
              when 'value1'
                'output1'
              else
                'output2'
              end
            RUBY
          end

          let(:correct_source) do
            <<-RUBY.strip_indent
              output = case variable
                       when 'value1'
                         'output1'
                       else
                         'output2'
                       end
              output = case variable
                       when 'value1'
                'output1'
              else
                'output2'
              end
            RUBY
          end

          it 'registers an offense' 


          it 'does auto-correction' 

        end
      end

      context "a when clause that's deeper than case" do
        let(:source) do
          <<-RUBY.strip_indent
            case a
                when 0 then return
                else
                    case b
                     when 1 then return
                    end
            end
          RUBY
        end

        it 'registers an offense' 


        it 'does auto-correction' 

      end

      it "accepts a when clause that's equally indented with case" 


      it "doesn't get confused by strings with case in them" 


      it "doesn't get confused by symbols named case or when" 


      it 'accepts correctly indented whens in complex combinations' 

    end

    context 'with IndentOneStep: true' do
      let(:cop_config) do
        { 'EnforcedStyle' => 'case', 'IndentOneStep' => true }
      end

      context 'with everything on a single line' do
        it 'does not register an offense' 

      end

      context 'regarding assignment where the right hand side is a case' do
        it 'accepts a correctly indented assignment' 


        context 'an assignment indented some other way' do
          let(:source) do
            <<-RUBY.strip_indent
              output = case variable
                       when 'value1'
                         'output1'
                       else
                         'output2'
                       end
            RUBY
          end

          let(:correct_source) do
            <<-RUBY.strip_indent
              output = case variable
                         when 'value1'
                         'output1'
                       else
                         'output2'
                       end
            RUBY
          end

          it 'registers an offense' 


          it 'does auto-correction' 

        end
      end

      it "accepts a when clause that's 2 spaces deeper than case" 


      context "a when clause that's equally indented with case" do
        let(:source) do
          <<-RUBY.strip_indent
            y = case a
                when 0 then break
                when 0 then return
                  z = case b
                      when 1 then return
                      when 1 then break
                      end
                end
            case c
            when 2 then encoding
            end
          RUBY
        end

        it 'registers an offense' 


        it 'does auto-correction' 

      end

      context 'when indentation width is overridden for this cop only' do
        let(:cop_config) do
          {
            'EnforcedStyle' => 'case',
            'IndentOneStep' => true,
            'IndentationWidth' => 5
          }
        end

        it 'respects cop-specific IndentationWidth' 

      end
    end
  end

  context 'with EnforcedStyle: end' do
    context 'with IndentOneStep: false' do
      let(:cop_config) do
        { 'EnforcedStyle' => 'end', 'IndentOneStep' => false }
      end

      context 'with everything on a single line' do
        it 'does not register an offense' 

      end

      context 'regarding assignment where the right hand side is a case' do
        it 'accepts a correctly indented assignment' 


        context 'an assignment indented some other way' do
          let(:source) do
            <<-RUBY.strip_indent
              output = case variable
                when 'value1'
                  'output1'
                else
                  'output2'
              end
            RUBY
          end

          let(:correct_source) do
            <<-RUBY.strip_indent
              output = case variable
              when 'value1'
                  'output1'
                else
                  'output2'
              end
            RUBY
          end

          it 'registers an offense' 


          it 'does auto-correction' 

        end
      end
    end

    context 'with IndentOneStep: true' do
      let(:cop_config) do
        { 'EnforcedStyle' => 'end', 'IndentOneStep' => true }
      end

      context 'with everything on a single line' do
        it 'does not register an offense' 

      end

      context 'regarding assignment where the right hand side is a case' do
        it 'accepts a correctly indented assignment' 


        context 'an assignment indented as case' do
          let(:source) do
            <<-RUBY.strip_indent
              output = case variable
                       when 'value1'
                         'output1'
                       else
                         'output2'
                       end
            RUBY
          end

          let(:correct_source) do
            <<-RUBY.strip_indent
              output = case variable
                         when 'value1'
                         'output1'
                       else
                         'output2'
                       end
            RUBY
          end

          it 'registers an offense' 


          it 'does auto-correction' 

        end

        context 'an assignment indented some other way' do
          let(:source) do
            <<-RUBY.strip_indent
              output = case variable
                     when 'value1'
                       'output1'
                     else
                       'output2'
                     end
            RUBY
          end

          let(:correct_source) do
            <<-RUBY.strip_indent
              output = case variable
                       when 'value1'
                       'output1'
                     else
                       'output2'
                     end
            RUBY
          end

          it 'registers an offense' 


          it 'does auto-correction' 

        end
      end
    end
  end

  context 'when case is preceded by something else than whitespace' do
    let(:cop_config) { {} }
    let(:source) do
      <<-RUBY.strip_indent
        case test when something
        end
      RUBY
    end

    it 'registers an offense' 


    it "doesn't auto-correct" 

  end
end


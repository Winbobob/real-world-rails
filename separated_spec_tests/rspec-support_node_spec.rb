require 'rspec/support/source/node'

class RSpec::Support::Source
  RSpec.describe Node, :if => RSpec::Support::RubyFeatures.ripper_supported? do
    let(:root_node) do
      Node.new(sexp)
    end

    let(:sexp) do
      require 'ripper'
      Ripper.sexp(source)
    end

    let(:source) { <<-END }
      variable = do_something(1, 2)
      variable.do_anything do |arg|
        puts arg
      end
    END

    # [:program,
    #  [[:assign,
    #    [:var_field, [:@ident, "variable", [1, 6]]],
    #    [:method_add_arg,
    #     [:fcall, [:@ident, "do_something", [1, 17]]],
    #     [:arg_paren,
    #      [:args_add_block,
    #       [[:@int, "1", [1, 30]], [:@int, "2", [1, 33]]],
    #       false]]]],
    #   [:method_add_block,
    #    [:call,
    #     [:var_ref, [:@ident, "variable", [2, 6]]],
    #     :".",
    #     [:@ident, "do_anything", [2, 15]]],
    #    [:do_block,
    #     [:block_var,
    #      [:params, [[:@ident, "arg", [2, 31]]], nil, nil, nil, nil, nil, nil],
    #      false],
    #     [[:command,
    #       [:@ident, "puts", [3, 8]],
    #       [:args_add_block, [[:var_ref, [:@ident, "arg", [3, 13]]]], false]]]]]]]

    describe '#args' do
      context 'when the sexp args consist of direct child sexps' do
        let(:target_node) do
          root_node.find { |node| node.type == :method_add_arg }
        end

        it 'returns the child nodes' 

      end

      context 'when the sexp args include an array of sexps' do
        let(:target_node) do
          root_node.find { |node| node.type == :args_add_block }
        end

        it 'returns pseudo expression sequence node for the array' 

      end
    end

    describe '#each_ancestor' do
      let(:target_node) do
        root_node.find { |node| node.type == :arg_paren }
      end

      it 'yields ancestor nodes from parent to root' 

    end

    describe '#location' do
      context 'with identifier type node' do
        let(:target_node) do
          root_node.find { |node| node.type == :@ident }
        end

        it 'returns a Location object with line and column numbers' 

      end

      context 'with non-identifier type node' do
        let(:target_node) do
          root_node.find { |node| node.type == :assign }
        end

        it 'returns nil' 

      end
    end

    describe '#inspect' do
      it 'returns a string including class name and node type' 

    end
  end
end


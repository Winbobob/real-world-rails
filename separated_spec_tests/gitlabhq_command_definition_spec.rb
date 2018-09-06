require 'spec_helper'

describe Gitlab::QuickActions::CommandDefinition do
  subject { described_class.new(:command) }

  describe "#all_names" do
    context "when the command has aliases" do
      before do
        subject.aliases = [:alias1, :alias2]
      end

      it "returns an array with the name and aliases" 

    end

    context "when the command doesn't have aliases" do
      it "returns an array with the name" 

    end
  end

  describe "#noop?" do
    context "when the command has an action block" do
      before do
        subject.action_block = proc { }
      end

      it "returns false" 

    end

    context "when the command doesn't have an action block" do
      it "returns true" 

    end
  end

  describe "#available?" do
    let(:opts) { OpenStruct.new(go: false) }

    context "when the command has a condition block" do
      before do
        subject.condition_block = proc { go }
      end

      context "when the condition block returns true" do
        before do
          opts[:go] = true
        end

        it "returns true" 

      end

      context "when the condition block returns false" do
        it "returns false" 

      end
    end

    context "when the command doesn't have a condition block" do
      it "returns true" 

    end
  end

  describe "#execute" do
    let(:context) { OpenStruct.new(run: false) }

    context "when the command is a noop" do
      it "doesn't execute the command" 

    end

    context "when the command is not a noop" do
      before do
        subject.action_block = proc { self.run = true }
      end

      context "when the command is not available" do
        before do
          subject.condition_block = proc { false }
        end

        it "doesn't execute the command" 

      end

      context "when the command is available" do
        context "when the commnd has no arguments" do
          before do
            subject.action_block = proc { self.run = true }
          end

          context "when the command is provided an argument" do
            it "executes the command" 

          end

          context "when the command is not provided an argument" do
            it "executes the command" 

          end
        end

        context "when the command has 1 required argument" do
          before do
            subject.action_block = ->(arg) { self.run = arg }
          end

          context "when the command is provided an argument" do
            it "executes the command" 

          end

          context "when the command is not provided an argument" do
            it "doesn't execute the command" 

          end
        end

        context "when the command has 1 optional argument" do
          before do
            subject.action_block = proc { |arg = nil| self.run = arg || true }
          end

          context "when the command is provided an argument" do
            it "executes the command" 

          end

          context "when the command is not provided an argument" do
            it "executes the command" 

          end
        end

        context 'when the command defines parse_params block' do
          before do
            subject.parse_params_block = ->(raw) { raw.strip }
            subject.action_block = ->(parsed) { self.received_arg = parsed }
          end

          it 'executes the command passing the parsed param' 

        end
      end
    end
  end

  describe '#explain' do
    context 'when the command is not available' do
      before do
        subject.condition_block = proc { false }
        subject.explanation = 'Explanation'
      end

      it 'returns nil' 

    end

    context 'when the explanation is a static string' do
      before do
        subject.explanation = 'Explanation'
      end

      it 'returns this static string' 

    end

    context 'when the explanation is dynamic' do
      before do
        subject.explanation = proc { |arg| "Dynamic #{arg}" }
      end

      it 'invokes the proc' 

    end
  end
end


# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Lint::UselessAssignment do
  subject(:cop) { described_class.new }

  context 'when a variable is assigned and unreferenced in a method' do
    it 'registers an offense' 

  end

  context 'when a variable is assigned and unreferenced ' \
          'in a singleton method defined with self keyword' do
    it 'registers an offense' 

  end

  context 'when a variable is assigned and unreferenced ' \
          'in a singleton method defined with variable name' do
    it 'registers an offense' 

  end

  context 'when a variable is assigned and unreferenced in a class' do
    it 'registers an offense' 

  end

  context 'when a variable is assigned and unreferenced in a class ' \
          'subclassing another class stored in local variable' do
    it 'registers an offense' 

  end

  context 'when a variable is assigned and unreferenced ' \
          'in a singleton class' do
    it 'registers an offense' 

  end

  context 'when a variable is assigned and unreferenced in a module' do
    it 'registers an offense' 

  end

  context 'when a variable is assigned and unreferenced in top level' do
    it 'registers an offense' 

  end

  context 'when a variable is assigned with operator assignment ' \
          'in top level' do
    it 'registers an offense' 

  end

  context 'when a variable is assigned multiple times ' \
          'but unreferenced' do
    it 'registers offenses for each assignment' 

  end

  context 'when a referenced variable is reassigned ' \
          'but not re-referenced' do
    it 'registers an offense for the non-re-referenced assignment' 

  end

  context 'when an unreferenced variable is reassigned ' \
          'and re-referenced' do
    it 'registers an offense for the unreferenced assignment' 

  end

  context 'when an unreferenced variable is reassigned in a block' do
    it 'accepts' 

  end

  context 'when a referenced variable is reassigned in a block' do
    it 'accepts' 

  end

  context 'when a block local variable is declared but not assigned' do
    it 'accepts' 

  end

  context 'when a block local variable is assigned and unreferenced' do
    it 'registers offenses for the assignment' 

  end

  context 'when a variable is assigned in loop body and unreferenced' do
    it 'registers an offense' 

  end

  context 'when a variable is reassigned at the end of loop body ' \
          'and would be referenced in next iteration' do
    it 'accepts' 

  end

  context 'when a variable is reassigned at the end of loop body ' \
          'and would be referenced in loop condition' do
    it 'accepts' 

  end

  context 'when a setter is invoked with operator assignment in loop body' do
    it 'accepts' 

  end

  context "when a variable is reassigned in loop body but won't " \
          'be referenced either next iteration or loop condition' do

    it 'registers an offense' 

  end

  context 'when a referenced variable is reassigned ' \
          'but not re-referenced in a method defined in loop' do
    it 'registers an offense' 

  end

  context 'when a variable that has same name as outer scope variable ' \
          'is not referenced in a method defined in loop' do
    it 'registers an offense' 

  end

  context 'when a variable is assigned in single branch if ' \
          'and unreferenced' do
    it 'registers an offense' 

  end

  context 'when a unreferenced variable is reassigned in same branch ' \
          'and referenced after the branching' do
    it 'registers an offense for the unreferenced assignment' 

  end

  context 'when a variable is reassigned in single branch if ' \
          'and referenced after the branching' do
    it 'accepts' 

  end

  context 'when a variable is reassigned in a loop' do
    context 'while loop' do
      it 'accepts' 

    end

    context 'post while loop' do
      it 'accepts' 

    end

    context 'until loop' do
      it 'accepts' 

    end

    context 'post until loop' do
      it 'accepts' 

    end

    context 'for loop' do
      it 'accepts' 

    end
  end

  context 'when a variable is assigned in each branch of if ' \
          'and referenced after the branching' do
    it 'accepts' 

  end

  context 'when a variable is reassigned in single branch if ' \
          'and referenced in the branch' do
    it 'registers an offense for the unreferenced assignment' 

  end

  context 'when a variable is assigned in each branch of if ' \
          'and referenced in the else branch' do
    it 'registers an offense for the assignment in the if branch' 

  end

  context 'when a variable is reassigned and unreferenced in a if branch ' \
          'while the variable is referenced in the paired else branch ' do
    it 'registers an offense for the reassignment in the if branch' 

  end

  context "when there's an unreferenced assignment in top level if branch " \
          'while the variable is referenced in the paired else branch' do
    it 'registers an offense for the assignment in the if branch' 

  end

  context "when there's an unreferenced reassignment in a if branch " \
          'while the variable is referenced in the paired elsif branch' do
    it 'registers an offense for the reassignment in the if branch' 

  end

  context "when there's an unreferenced reassignment in a if branch " \
          'while the variable is referenced in a case branch ' \
          'in the paired else branch' do
    it 'registers an offense for the reassignment in the if branch' 

  end

  context 'when an assignment in a if branch is referenced ' \
          'in another if branch' do
    it 'accepts' 

  end

  context 'when a variable is assigned in branch of modifier if ' \
          'that references the variable in its conditional clause' \
          'and referenced after the branching' do
    it 'accepts' 

  end

  context 'when a variable is assigned in branch of modifier if ' \
          'that references the variable in its conditional clause' \
          'and unreferenced' do
    it 'registers an offense' 

  end

  context 'when a variable is assigned on each side of && ' \
          'and referenced after the &&' do
    it 'accepts' 

  end

  context 'when a unreferenced variable is reassigned ' \
          'on the left side of && and referenced after the &&' do
    it 'registers an offense for the unreferenced assignment' 

  end

  context 'when a unreferenced variable is reassigned ' \
          'on the right side of && and referenced after the &&' do
    it 'accepts' 

  end

  context 'when a variable is reassigned ' \
          'while referencing itself in rhs and referenced' do
    it 'accepts' 

  end

  context 'when a variable is reassigned ' \
          'with binary operator assignment and referenced' do
    it 'accepts' 

  end

  context 'when a variable is reassigned ' \
          'with logical operator assignment and referenced' do
    it 'accepts' 

  end

  context 'when a variable is reassigned with binary operator ' \
           'assignment while assigning to itself in rhs ' \
           'then referenced' do
    it 'registers an offense for the assignment in rhs' 

  end

  context 'when a variable is assigned first with ||= and referenced' do
    it 'accepts' 

  end

  context 'when a variable is assigned with ||= ' \
          'at the last expression of the scope' do
    it 'registers an offense' 

  end

  context 'when a variable is assigned with ||= ' \
          'before the last expression of the scope' do
    it 'registers an offense' 

  end

  context 'when a variable is assigned with multiple assignment ' \
          'and unreferenced' do
    it 'registers an offense' 

  end

  context 'when a variable is reassigned with multiple assignment ' \
          'while referencing itself in rhs and referenced' do
    it 'accepts' 

  end

  context 'when a variable is assigned in loop body ' \
          'and referenced in post while condition' do
    it 'accepts' 

  end

  context 'when a variable is assigned in loop body ' \
          'and referenced in post until condition' do
    it 'accepts' 

  end

  context 'when a variable is assigned ' \
          'in main body of begin with rescue but unreferenced' do
    it 'registers an offense' 

  end

  context 'when a variable is assigned in main body of begin, rescue ' \
          'and else then referenced after the begin' do
    it 'accepts' 

  end

  context 'when a variable is reassigned multiple times ' \
          'in main body of begin then referenced after the begin' do
    it 'accepts' 

  end

  context 'when a variable is reassigned multiple times ' \
          'in main body of begin then referenced in rescue' do
    it 'accepts' 

  end

  context 'when a variable is reassigned multiple times ' \
          'in main body of begin then referenced in ensure' do
    it 'accepts' 

  end

  context 'when a variable is reassigned multiple times in rescue ' \
          'and referenced after the begin' do
    it 'registers an offense' 

  end

  context 'when a variable is reassigned multiple times ' \
          'in rescue with ensure then referenced after the begin' do
    it 'registers an offense' 

  end

  context 'when a variable is reassigned multiple times ' \
          'in ensure with rescue then referenced after the begin' do
    it 'registers an offense' 

  end

  context 'when a variable is assigned at the end of rescue ' \
          'and would be referenced with retry' do
    it 'accepts' 

  end

  context 'when a variable is assigned with operator assignment ' \
          'in rescue and would be referenced with retry' do
    it 'accepts' 

  end

  context 'when a variable is assigned ' \
          'in main body of begin, rescue and else ' \
          'and reassigned in ensure then referenced after the begin' do
    it 'registers offenses for each assignment before ensure' 

  end

  context 'when a rescued error variable is wrongly tried to be referenced ' \
          'in another rescue body' do
    it 'registers an offense' 

  end

  context 'when a method argument is reassigned ' \
          'and zero arity super is called' do
    it 'accepts' 

  end

  context 'when a local variable is unreferenced ' \
          'and zero arity super is called' do
    it 'registers an offense' 

  end

  context 'when a method argument is reassigned ' \
          'but not passed to super' do
    it 'registers an offense' 

  end

  context 'when a named capture is unreferenced in top level' do
    it 'registers an offense' 

  end

  context 'when a named capture is unreferenced ' \
          'in other than top level' do
    it 'registers an offense' 

  end

  context 'when a named capture is referenced' do
    it 'accepts' 

  end

  context 'when a variable is referenced ' \
          'in rhs of named capture expression' do
    it 'accepts' 

  end

  context 'when a variable is assigned in begin ' \
          'and referenced outside' do
    it 'accepts' 

  end

  context 'when a variable is shadowed by a block argument ' \
          'and unreferenced' do
    it 'registers an offense' 

  end

  context 'when a variable is not used and the name starts with _' do
    it 'accepts' 

  end

  context 'when a method argument is not used' do
    it 'accepts' 

  end

  context 'when an optional method argument is not used' do
    it 'accepts' 

  end

  context 'when a block method argument is not used' do
    it 'accepts' 

  end

  context 'when a splat method argument is not used' do
    it 'accepts' 

  end

  context 'when a optional keyword method argument is not used' do
    it 'accepts' 

  end

  context 'when a keyword splat method argument is used' do
    it 'accepts' 

  end

  context 'when a keyword splat method argument is not used' do
    it 'accepts' 

  end

  context 'when an anonymous keyword splat method argument is defined' do
    it 'accepts' 

  end

  context 'when a block argument is not used' do
    it 'accepts' 

  end

  context 'when there is only one AST node and it is unused variable' do
    it 'registers an offense' 

  end

  context 'when a variable is assigned ' \
          'while being passed to a method taking block' do
    context 'and the variable is used' do
      it 'accepts' 

    end

    context 'and the variable is not used' do
      it 'registers an offense' 

    end
  end

  context 'when a variable is assigned ' \
          'and passed to a method followed by method taking block' do
    it 'accepts' 

  end

  # regression test, from problem in Locatable
  context 'when a variable is assigned in 2 identical if branches' do
    it "doesn't think 1 of the 2 assignments is useless" 

  end

  describe 'similar name suggestion' do
    context "when there's a similar variable-like method invocation" do
      it 'suggests the method name' 

    end

    context "when there's a similar variable" do
      it 'suggests the variable name' 

    end

    context 'when there are only less similar names' do
      it 'does not suggest any name' 

    end

    context "when there's a similar method invocation with explicit receiver" do
      it 'does not suggest any name' 

    end

    context "when there's a similar method invocation with arguments" do
      it 'does not suggest any name' 

    end

    context "when there's a similar name but it's in inner scope" do
      it 'does not suggest any name' 

    end
  end
end


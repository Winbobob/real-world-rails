describe ExceptionPolicy do
  class SomePolicy
    include ExceptionPolicy

    def fail!
      check(false, "Fail failed")
    end

    def success!
      check(true, "Success failed")
    end
  end

  let (:policy) {SomePolicy.new(:some_user, :some_record)}
  describe "#method_missing" do
    it "converts questions into booleans" 


    it "continues to operate as expected on others" 

  end

  describe "#check" do
    it "doesn't raise an exception on success" 


    it "does raise an exception on failure" 

  end
end


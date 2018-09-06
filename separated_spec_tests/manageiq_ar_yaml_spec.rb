describe ActiveRecord::AttributeAccessorThatYamls do
  Vm.class_eval do
    include ActiveRecord::AttributeAccessorThatYamls
    attr_accessor_that_yamls :access1, :access2
    attr_reader_that_yamls   :read1
    attr_writer_that_yamls   :write1
  end

  it "attr_accessor_that_yamls" 


  it "attr_reader_that_yamls" 


  it "attr_writer_that_yamls" 

end


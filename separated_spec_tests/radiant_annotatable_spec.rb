require File.dirname(__FILE__) + "/../spec_helper"

describe Annotatable, "when included in a class" do
  class BasicAnnotation
    include Annotatable
  end

  it "should add the annotate method to a class" 

end

describe Annotatable, "with an annotation added to a class" do
  class AnnotationsAdded
    include Annotatable
    annotate :description
  end

  it "should add class accessor methods of the given name for the annotation" 


  it "should add instance accessor methods of the given name for the annotation" 

  
  it "should set the value of the annotation when called with a parameter" 

  
  it "should set the value of the annotation when assigned directly" 

  
  it "should set the value of the annotation when called with a parameter on an instance" 

  
  it "should set the value of the annotation when assigned directly on an instance" 

end

describe Annotatable, "with annotations defined on a parent class" do
  class ParentClass
    include Annotatable
    annotate :description, :url
    annotate :another, inherit: true
    description "A parent class"
    url "http://test.host"
    another "I'm inherited!"
  end

  class ChildClass < ParentClass
  end

  class OverridingClass < ParentClass
    another "I'm not inherited!"
  end
  
  it "should receive all parent annotations" 

  
  it "should inherit the parent class' values for inherit annotations" 

  
  it "should not inherit values for non-inherited annotations" 

  
  it "should override inherited values when annotated in a child class" 

end


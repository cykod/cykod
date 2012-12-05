require "spec_helper"

describe Stormy::Post do


  describe "validations" do 
    subject { Stormy::Post.new }

    it { should be_invalid }
    it { should have(1).errors_on(:title) }
  end

  describe "permalink" do

    it "downcases" do
      Stormy::Post.create(:title => "MySuperTitle").permalink.should eq("mysupertitle") 
    end

    it "condenses whitespace" do
      Stormy::Post.create(:title => "This   is    a   test").permalink.should eq("this-is-a-test")
    end

    it "get rids of special characters" do
      Stormy::Post.create(:title => "What the $#$!!%!@#^#$! is going on?").permalink.should eq("what-the-is-going-on")
    end

  end
end

require "spec_helper"

describe Stormy::Post do


  describe "validations" do 
    subject { Stormy::Post.new }

    it { should be_invalid }
    it { should have(1).errors.on(:title) }
  end

  describe "permalinks" do

  end


end

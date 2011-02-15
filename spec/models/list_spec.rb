require 'spec_helper'

describe List do
  before(:each) do
    @attr = { :name => "4 kyuu", :description => "JLPT 4 words" }
  end

  it "should create a new instance given valid attributes" do
    List.create!(@attr)
  end
  
  it "should require name" do
    no_name = List.new(@attr.merge(:name => ""))
    no_name.should_not be_valid
  end
  
  it "should reject duplicate list names" do
    List.create!(@attr)
    duplicate_name = List.new(@attr)
    duplicate_name.should_not be_valid
  end
end
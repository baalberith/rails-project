require 'spec_helper'

describe Word do
  before(:each) do
    @attr = { :word => "一日", :reading => "いちにち" }
  end

  it "should create a new instance given valid attributes" do
    Word.create!(@attr)
  end
  
  it "should require a word or word reading" do
    no_word = Word.new(@attr.merge(:word => ""))
    no_word.should be_valid
    no_reading = Word.new(@attr.merge(:reading => ""))
    no_reading.should be_valid
    no_word_and_reading = Word.new(@attr.merge(:word => "", :reading => ""))
    no_word_and_reading.should_not be_valid
  end
  
  it "should reject duplicate words" do
    Word.create!(@attr)
    duplicate_word = Word.new(@attr)
    duplicate_word.should_not be_valid
  end
end

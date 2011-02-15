require 'spec_helper'

describe "GET 'home'" do
  it "should be successful" do
    get '/'
    response.should be_success
  end
end

describe "GET 'about'" do
  it "should be successful" do
    get 'about'
    response.should be_success
  end
end

describe "GET 'words'" do
  it "should be successful" do
    get 'words'
    response.should be_success
  end
end

describe "GET 'kanjis'" do
  it "should be successful" do
    get 'kanjis'
    response.should be_success
  end
end

describe "GET 'all_lists'" do
  it "should be successful" do
    get 'all_lists'
    response.should be_success
  end
end

describe "GET 'users/sign_in'" do
  it "should be successful" do
    get 'users/sign_in'
    response.should be_success
  end
end

describe "LayoutLinks" do
  it "should have a Home page at '/'" do
    get '/'
    response.should have_selector('title', :content => "Home")
  end

  it "should have a About page at 'about'" do
    get 'about'
    response.should have_selector('title', :content => "About")
  end
  
  it "should have the right links on the layout" do
    visit root_path
    click_link "Sign up!"
    response.should be_success
    click_link "About"
    response.should have_selector('title', :content => "About")
  end
end

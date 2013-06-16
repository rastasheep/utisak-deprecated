require 'spec_helper'

describe PagesController do

  describe "GET 'about'" do
    it "should be successful" do
      get 'about'
      response.should be_success
    end
  end

  describe "GET 'api'" do
    it "should be successful" do
      get 'api'
      response.should be_success
    end
  end

  describe "GET 'markdown'" do
    it "should be successful" do
      get 'markdown'
      response.should be_success
    end
  end

end

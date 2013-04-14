require 'spec_helper'

describe Api::V1::NewsController do

  let(:news) { FactoryGirl.create(:news) }
  let(:user) { FactoryGirl.create(:user, :authentication_token => 1234) }
  before { news }

  describe "GET index" do

    before { get :index }

    it "returns http 200" do
      response.response_code.should == 200
    end

    it "renders news as JSON" do
      response.body.should include("My first news.")
    end

  end

  describe "GET show" do

    before { get :show, id: news.id }

    it "returns http 200" do
      response.response_code.should == 200
    end

    it "renders news as JSON" do
      response.body.should == news.to_json
    end

  end

  describe "POST create" do

    context "no params" do

      it "returns http 400" do
        post :create, auth_token: user.authentication_token

        response.response_code.should == 400
      end

    end

    context "with auth token" do

      before { post :create, title: 'New news', url: 'http://yahoo.com', domain: 'yahoo.com', auth_token: user.authentication_token }

      it "returns http 200" do
        response.response_code.should == 200
      end

      it "renders new news as JSON" do
        response.body.should include "New news"
      end

      it "user owns created news" do
        response.body.should include ("\"user_id\":#{user.id}")
      end

    end

    context "without auth token" do

      it "returns http 401" do
        post :create, title: 'New news', url: 'http://yahoo.com', domain: 'yahoo.com'

        response.response_code.should == 401
      end

    end

    context "wrong credentials" do

      it "returns http 401" do
        post :create, title: 'New news', url: 'http://yahoo.com', domain: 'yahoo.com', auth_token: "fake_auth"

        response.response_code.should == 401
      end

    end

  end

  describe 'DELETE destroy' do

    context "with auth token" do

      it "returns http 200" do
        delete :destroy, id: news.id, auth_token: user.authentication_token

        response.response_code.should == 204
      end

    end

    context "without auth token" do

      it "returns http 401" do
        delete :destroy, id: news.id

        response.response_code.should == 401
      end

    end

    context "wrong credentials" do

      it "returns http 401" do
        delete :destroy, id: news.id, auth_token: "fake_token"

        response.response_code.should == 401
      end

    end

  end

  describe "PUT update" do

    context "no params" do

      before { put :update, id: news.id, auth_token: user.authentication_token }

      it "returns http 204" do
        response.response_code.should == 204
      end

    end

    context "no news with id" do

      before { put :update, id: 666, auth_token: user.authentication_token }

      it "returns http 404" do
        response.response_code.should == 404
      end

    end

    context "with auth token" do

      it "returns http 204" do
        put :update, id: news.id, url: "http://yahoo.com", auth_token: user.authentication_token

        response.response_code.should == 204
      end

    end

    context "without auth token" do

      it "returns http 401" do
        put :update, id: news.id, url: "http://yahoo.com"

        response.response_code.should == 401
      end

    end

    context "wrong credentials" do

      it "returns http 401" do
        put :update, id: news.id, url: "http://yahoo.com", auth_token: "fake_token"

        response.response_code.should == 401
      end

    end

  end

end

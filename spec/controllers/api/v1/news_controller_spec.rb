require 'spec_helper'

describe Api::V1::NewsController do

  let(:news) { FactoryGirl.create(:news) }
  let(:user) { FactoryGirl.create(:user, :authentication_token => 1234) }
  before { news }
  before { user }

  describe 'GET index' do
    before { get :index }

    it 'returns http 200' do
      response.response_code.should == 200
    end

    it "renders news as JSON" do
      response.body.should include("My first news.")
    end
  end

  describe 'GET show' do
    before { get :show, id: news.id }

    it 'returns http 200' do
      response.response_code.should == 200
    end

    it "renders news as JSON" do
      response.body.should == news.to_json
    end
  end

#  describe 'POST create' do
#    before do
#      @request.env['devise.mapping'] = Devise.mappings[:user];
#      user.ensure_authentication_token!
#    end
#
#    context 'no param' do
#      it "returns http 400" do
#        post :create
#
#        response.response_code.should == 400
#      end
#    end
#
#    context "user have auth token" do
#      before do
#        controller.stub(:user_signed_in?) {true}
#      end
#
#      it 'returns http 200' do
#        post :create, title: 'New news', url: 'http://yahoo.com', domain: 'yahoo.com', auth_token: user.authentication_token
#        response.response_code.should == 200
#      end
#
#      it "renders news as JSON" do
#        response.body.should == news.to_json
#      end
#    end
#  end
end

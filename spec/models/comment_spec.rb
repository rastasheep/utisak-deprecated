require 'spec_helper'

describe Comment do

    it { should have_db_column(:user_id).of_type(:integer) }
    it { should have_db_column(:news_id).of_type(:integer) }
    it { should have_db_column(:content).of_type(:text) }

    context "validations" do
      subject { FactoryGirl.create(:comment) }
      it { should validate_presence_of(:content) }
    end

    it { should belong_to :user }
    it { should belong_to :news }
end

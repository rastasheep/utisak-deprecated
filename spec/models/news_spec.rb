require 'spec_helper'

describe News do

    it { should have_db_column(:user_id).of_type(:integer) }
    it { should have_db_column(:title).of_type(:string) }
    it { should have_db_column(:content).of_type(:text) }
    it { should have_db_column(:url).of_type(:string) }
    it { should have_db_column(:domain).of_type(:string) }
    it { should have_db_column(:points).of_type(:integer) }

    context "validations" do
      subject { FactoryGirl.create(:news) }
      it { should validate_uniqueness_of(:url) }
      it { should validate_uniqueness_of(:title) }
      it { should validate_presence_of(:url) }
      it { should validate_presence_of(:title) }
    end

    it { should belong_to :user }
    it { should have_many(:comments).dependent(:destroy) }


    describe "#vote" do
      before do
        @news = FactoryGirl.create(:news)
      end

      it "increse points by one" do
        @news.should_receive(:update_attributes).with(:points => @news.points + 1)
        @news.vote!
      end

    end

end

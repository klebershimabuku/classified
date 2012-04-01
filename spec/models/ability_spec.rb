require 'spec_helper'
require 'cancan/matchers'

describe "User" do

  describe "abilities" do

    subject { ability }
    let(:ability) { Ability.new(user) }

    context "when is an admin" do
      let(:user) { FactoryGirl.create(:admin) }
      it { should be_able_to(:manage, :all) }
    end

    context "when is an user" do
      let(:user) { FactoryGirl.create(:user) }
      it { should be_able_to(:create, Post.new) }
      it { should_not be_able_to(:destroy, Post.new) }
      it { should_not be_able_to(:expire, Post.new) }
      it "should be_able_to update his posts" do
        pending
      end
    end

  end

end

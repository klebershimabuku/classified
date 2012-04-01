require 'spec_helper'

describe User do

  before(:each) do
    @attr = { :email => "user@example.com", :password => "foobar" }
  end

  describe "turning user status" do

    before(:each) do
      @user = User.create!(@attr)
      @user.role = "user"
    end

    it "#manager!" do
      @user.manager!
      @user.role.should == "manager"
    end

    it "#moderator!" do
      @user.moderator!
      @user.role.should == "moderator"
    end

    it "#user!" do
      @user.moderator!
      @user.user!
      @user.role.should == "user"
    end

  end

end

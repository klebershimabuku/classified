require 'spec_helper'

describe UsersController do

  include Devise::TestHelpers

  it "should get #index" do
    get 'index'
    response.should be_success
  end

  context "should get #show" do
    before { @user =  FactoryGirl.create(:user) } 

    get 'show', :id => @user
    response.should be_success
  end

  it "should DELETE #destroy" do
    delete 'destroy'
    response.should be_success
  end

end

require 'spec_helper'

describe UsersController do

  include Devise::TestHelpers

  it "should get #index" do
    get 'index'
    response.should be_success
  end

  context "should get #show" do
    pending
  end

  it "should DELETE #destroy" do
    pending
  end

end

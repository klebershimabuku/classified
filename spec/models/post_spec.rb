require 'spec_helper'

describe "Post" do

  context "#pending" do

    before(:each) do
      @post_1 = FactoryGirl.create(:post, :status => 'pending', :created_at => 2.days.ago)
      @post_2 = FactoryGirl.create(:post, :status => 'pending', :created_at => 10.days.ago)
    end

    it "returns all pending posts" do
      pending_posts = Post.pending
      pending_posts.should == [@post_2, @post_1]
    end

    it "returns the pending posts count" do
      pending_posts_count = Post.pending.size
      pending_posts_count.should == 2
    end

    it "changes a post status to 'pending' " do
      post = FactoryGirl.create(:post)
      post.status.should == 'active'
      post.pending!
      post.status.should == 'pending'
    end
  end

  context "#active" do

    before(:each) do
      @post_1 = FactoryGirl.create(:post, :status => 'active', :created_at => 2.days.ago)
      @post_2 = FactoryGirl.create(:post, :status => 'active', :created_at => 10.days.ago)
    end

    it "returns all active posts" do
      pending_posts = Post.active
      pending_posts.should == [@post_2, @post_1]
    end

    it "returns the active posts count" do
      pending_posts_count = Post.active.size
      pending_posts_count.should == 2
    end

    it "changes a post status to 'active' " do
      post = FactoryGirl.create(:post, :status => 'pending')
      post.status.should == 'pending'
      post.activate!
      post.status.should == 'active'
    end

    #
    # returns true or false
    #
    it "returns true or false for .active?" do
      @post_1.active?.should == true
    end
  end

  context "#review" do

    before(:each) do
      @post_1 = FactoryGirl.create(:post, :status => 'review', :created_at => 2.days.ago)
      @post_2 = FactoryGirl.create(:post, :status => 'review', :created_at => 10.days.ago)
    end

    it "returns all review posts" do
      pending_posts = Post.review
      pending_posts.should == [@post_2, @post_1]
    end

    it "returns the review posts count" do
      pending_posts_count = Post.review.size
      pending_posts_count.should == 2
    end

    it "changes a post status to 'review' " do
      post = FactoryGirl.create(:post, :status => 'pending')
      post.status.should == 'pending'
      post.review!
      post.status.should == 'review'
    end
  end


  context "#expire" do

    before(:each) do
      @post_1 = FactoryGirl.create(:post, :status => 'expired', :created_at => 2.days.ago)
      @post_2 = FactoryGirl.create(:post, :status => 'expired', :created_at => 10.days.ago)
    end

    it "returns all expired posts" do
      pending_posts = Post.expired
      pending_posts.should == [@post_2, @post_1]
    end

    it "returns the expired posts count" do
      pending_posts_count = Post.expired.size
      pending_posts_count.should == 2
    end

    it "changes a post status to 'expired' " do
      post = FactoryGirl.create(:post, :status => 'pending')
      post.status.should == 'pending'
      post.expire!
      post.status.should == 'expired'
    end
  end

  context "#increment_with_sql" do

    before { @post = FactoryGirl.create(:post, :hits => 10) }

    it "increments the hits counter by 1" do
      @post.increment_with_sql!(:hits)
      @post.hits.should == 11
    end

  end

  context "PREFECTURES" do

    it "returns an array with all japan prefectures" do
      Post::PREFECTURES.class.should == Array
    end
    
    it "cannot be nil" do
      Post::PREFECTURES.should_not be_nil
    end

    it "returns the number of japan prefectures" do
      Post::PREFECTURES.size.should == 47
    end

  end

  context "MAKES" do

    it "returns an array with all makes" do
      Post::MAKES.class.should == Array
    end
    
    it "cannot be nil" do
      Post::MAKES.should_not be_nil
    end

    it "returns the number of makes" do
      Post::MAKES.size.should == 39
    end

  end

end

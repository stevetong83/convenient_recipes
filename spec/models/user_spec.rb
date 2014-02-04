require 'spec_helper'

describe User do

  describe :followed_users do
    before do
      @user = FactoryGirl.create :user
      @followed_user = FactoryGirl.create :user
      @relationship = FactoryGirl.create :relationship, user: @user, followed: @followed_user
    end

    it {@user.followed_users.should =~ [@followed_user]}
  end

  describe :followers do
    before do
      @user = FactoryGirl.create :user
      @following_user = FactoryGirl.create :user
      @relationship = FactoryGirl.create :relationship, user: @following_user, followed: @user
    end

    it {@user.followers.should =~ [@following_user]}
  end

  describe :destroy do
    before do
      @count = Relationship.count
      @user = FactoryGirl.create :user
      @following_user = FactoryGirl.create :user
      @relationship = FactoryGirl.create :relationship, user: @following_user, followed: @user
    end

    it "should delete the relationship" do
      @user.destroy
      Relationship.count.should eq @count
    end

    it "should delete the relationship" do
      @following_user.destroy
      Relationship.count.should eq @count
    end
  end
  

  describe :follow! do
    before do
      @count = Relationship.count
      @user = FactoryGirl.create :user
      @followed_user = FactoryGirl.create :user
    end

    it "should create a new relationship" do
      @relationship = @user.follow! @followed_user
      Relationship.count.should eq @count + 1
      Relationship.last.followed.should eq @followed_user
      Relationship.last.user.should eq @user
    end
  end

end

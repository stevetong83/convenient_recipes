require 'spec_helper'

describe "Recipe Pages" do 

  describe "Logged Out" do

  end

  describe "Logged In" do 

    before do 
      @user = FactoryGirl.create :user
      login(@user)
    end

    describe "Creating a new recipe with valid params" do 
      visit new_recipe_path
    end

  end

  

end
#encoding: utf-8
require 'spec_helper'

describe "StaticPages" do

  subject { page }

  let(:base_title) { "Carecia" }

  #
  # Home page
  #
  describe "Home page" do

    before(:each) do 
      FactoryGirl.create(:post)
      visit root_path
    end

    it "should have the content 'Anúncios Recentes' " do
      should have_selector('h1', :text => "Anúncios Recentes")
    end

    it "should have the right title" do
      should have_selector('title', :text => "#{base_title} | Home")
    end
  end

  #
  # Terms of conditions
  #
  describe "Terms of conditions page" do

    before(:each) { visit tos_path }

    it "should have the content 'Termos e condições de uso' " do
      should have_selector('h1', :text => "Termos e condições de uso")
    end

    it "should have the right title" do
      should have_selector('title', :text => "#{base_title} | Termos e condições de uso")
    end
  end

  
end

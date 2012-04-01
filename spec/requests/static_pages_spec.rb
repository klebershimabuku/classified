#encoding: utf-8
require 'spec_helper'

describe "StaticPages" do

  subject { page }

  let(:base_title) { "Carecia" }

  #
  # Home page
  #
  describe "Home page" do

    before(:each) { visit root_path }

    it "should have the content 'O lugar ideal para o seu negócio' " do
      should have_selector('h1', :text => "Quer vender seu carro, sua moto")
    end

    it "should have the right title" do
      should have_selector('title', :text => "#{base_title} | O lugar ideal para o seu negócio")
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

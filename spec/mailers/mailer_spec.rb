require 'spec_helper'

describe "Mailer" do


  context "Contact form" do
    let(:sender_name) { "foo bar" }
    let(:from) { "foo@example.com" }
    let(:subject) { "user message" }
    let(:message) { "a simple user message" }
    let(:email) { Mailer.contact_form(sender_name, from, subject, message) }
    
    it "should be set to be delivered to the email passed in" do
      email.should deliver_to("Kleber Shimabuku <klebershimabuku@gmail.com>")
    end  
  
  end
end

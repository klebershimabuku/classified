include ActionDispatch::TestProcess

FactoryGirl.define do


  factory :user do
  end

  factory :post do
    title "Lorem Ipsum"
    description "Some random text goes here"
    price "500000"
    model "S 403"
    makes "Toyota"
    prefecture "Aichi-ken"
    contact_info "ryu ryusaki"
    year "2012"
    shaken_validation "dez/2014"
    attachments [ Rack::Test::UploadedFile.new(Rails.root.join("spec/fixtures/files/example.jpg"), "image/jpeg") ]
    #attachments [ File.open(Rails.root.join("spec/fixtures/files/example.jpg")) ]
  end

end

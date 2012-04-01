include ActionDispatch::TestProcess

FactoryGirl.define do

  factory :user do
    email 'user@example.com'
    password 'foobar'
    role 'user'
  end

  factory :admin, :parent => :user do
    email 'admin@example.com'
    password 'foobar'
    role 'admin'
  end

  factory :moderator, :parent => :user do
    email 'moderator@example.com'
    password 'foobar'
    role 'moderator'
  end

  factory :attachment do
    file { fixture_file_upload(Rails.root.join(*%w[spec fixtures files example.jpg]), 'image/jpg') }
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
    status 'active'
    attachments { [ FactoryGirl.create(:attachment) ] }
  end

end

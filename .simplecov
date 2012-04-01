# .simplecov
SimpleCov.start 'rails' do
  add_filter 'spec'

  add_group 'Mailers', 'app/mailers'
end

guard 'rspec', :version => 2, :cli => "--drb --color --format documentation", :all_on_start => false, :all_after_pass => false do
  watch(%r{^lib/(.+)\.rb$})                           { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch(%r{^app/(.+)\.rb$})                           { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^lib/(.+)\.rb$})                           { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch(%r{^app/controllers/(.+)_(controller)\.rb$})  { |m| ["spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb", "spec/acceptance/#{m[1]}_spec.rb"] }
  watch('spec/spec_helper.rb')
  watch(%r{^spec/support/.+\.rb$})
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^app/views/(.+)/.+.html.slim$})            { |m| "spec/acceptance/#{m[1]}_spec.rb"}
  watch('config/routes.rb')                           { "spec/acceptance" }
  watch('app/controllers/application_controller.rb')  { "spec/controllers" }
  watch(%r{^spec/fabricators/(.+)_fabricator\.rb$})   { |m| "spec/models/#{m[2]}_spec.rb" }
  watch(%r{^spec/factories/(.+)_factory\.rb$})        { |m| "spec/models/#{m[2]}_spec.rb" }
end



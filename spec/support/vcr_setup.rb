require 'vcr'
VCR.configure do |c|
  #the directory where your cassettes will be saved
  c.cassette_library_dir = "spec/cassettes"
  # your HTTP request service.
  c.hook_into :webmock
  c.hook_into :typhoeus
end

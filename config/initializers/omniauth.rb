Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :twitter, 'OtgUJ38USbc3PnbRH1i9DA', 'sZGgzbqX3xPhzoVru6uzpIvrBwIRIQbrHVDG5CXrm8'
end

if Rails.env.production?
  OmniAuth.config.full_host = "http://railspg.com"
else
  OmniAuth.config.full_host = "http://localhost:3000"
end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :github, ENV['GITHUB_CLIENT_ID'],ENV['GITHUB_CLIENT_SECRET'], {:provider_ignores_state => true}
end
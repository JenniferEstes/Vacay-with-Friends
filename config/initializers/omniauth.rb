Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV['GITHUB_CLIENT_ID'],ENV['GITHUB_CLIENT_SECRET'], scope: 'user:email'
end

OmniAuth.config do |config|
  config.silence_get_warning = true
  # Disable the redirect to /auth/failure and always raise
  config.failure_raise_out_environments = ['test', 'development', 'staging', 'production']
end
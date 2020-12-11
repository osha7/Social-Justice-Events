Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']
  provider OmniAuth::Strategies::GoogleOauth2, ENV['GOOGLE_KEY'], ENV['GOOGLE_SECRET']
  # provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET'], scope: 'user:email'
end


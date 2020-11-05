Rails.application.config.middleware.use OmniAuth::Builder do
  provider :omniauth-github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET'], scope: 'user:email'
end


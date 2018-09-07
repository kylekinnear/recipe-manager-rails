Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, '3ef15dd83ccbd02af2a6', '2fae2a803d791b00ceaa1f93f41e87a17c803a73'
end

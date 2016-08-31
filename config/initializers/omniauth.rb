Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, "no", "nope"
end

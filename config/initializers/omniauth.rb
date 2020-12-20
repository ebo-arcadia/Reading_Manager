Rails.application.config.middleware.use OmniAuth::Builder do
    provider :github, '5fda94fa73707d042fe4', '74e152a5ccddbb3f34ef89d9604d93e990594c02'
end
Rails.application.config.middleware.use OmniAuth::Builder do
    if Rails.env.development? || Rails.env.test?
        # OmniAuth.config.full_host = "http://localhost:3000"
        provider :github, ENV.fetch("CLIENT_ID"), ENV.fetch("CLIENT_SECRET"), {:provider_ignores_state => true}

    else
        provider :github,
            Rails.application.credentials.github[:client_id],
            Rails.application.credentials.github[:client_secret]
    end
end
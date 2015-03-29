OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1452812425010270', '98fb40456c553e46c9d826a08c62f02b'
  provider :twitter, 'LpevWO724sHTBbK81VHdYOO2g', 'LN7rrcEPHYhuwL52B0RIHQpF3vXwkrZycfBgjSKuryfSfP5mVx'
  provider :vkontakte, '4851143', 'dwMG2GFSIM4ZKt0FflZe'
end
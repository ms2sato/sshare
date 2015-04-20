# Be sure to restart your server when you modify this file.

if ENV['REDISTOGO_URL']
  redis_uri = URI(ENV['REDISTOGO_URL'])
  # http://higelog.brassworks.jp/?p=2307
  Sshare::Application.config.session_store :redis_store, expire_after: 60.days, :domain => 'herokuapp.com', :servers => {
                                                           host: redis_uri.host,
                                                           port: redis_uri.port,
                                                           password: redis_uri.password,
                                                           namespace: "sshare:sessions"
                                                       }, expires_in: 60.days
  # elsif Rails.env.development?
else
  Sshare.application.config.session_store :cookie_store, key: '_sshare_session'
end

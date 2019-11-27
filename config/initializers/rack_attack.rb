# config/initializers/rack_attack.rb
class Rack::Attack
  ## ブラックリスト設定 ##
  # 1.2.3.4からのアクセスを拒否する
  # Rack::Attack.blocklist('block 1.2.3.4') do |req|
  #   '1.2.3.4' == req.ip
  # end

  # BadUAが含まれたUserAgentからのログイン画面アクセスを拒否する
  # Rack::Attack.blocklist('block bad UA logins') do |req|
  #   req.path == '/login' && req.post? && req.user_agent == 'BadUA'
  # end


  ## ホワイトリスト設定 ##
  # Rack::Attack.safelist('allow from localhost') do |req|
  #     '127.0.0.1' == req.ip || '::1' == req.ip
  # end


  ## アクセス回数による制御 ##
  # 同一IPアドレスからのリクエストを60回/分に制限
  throttle('req/ip', :limit => 60, :period => 1.minutes) do |req|
    req.ip
  end

end
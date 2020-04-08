#CarrierWaveを通してS3を使うように修正する
if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      #S3用
      provider: 'AWS',
      aws_access_key_id: ENV['S3_ACCESS_KEY'],
      aws_secret_access_key: ENV['S3_SECRET_KEY'],
      region: 'ap-northeast-1'      
    }
    config.storage = :fog
    config.fog_directory = 'jiboys'
  end
end


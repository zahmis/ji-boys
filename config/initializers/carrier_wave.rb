#CarrierWaveを通してS3を使うように修正する
if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      #S3用
      :provider =>'AWS',
      :region => ENV['ap-northeast-1'],
      :aws_access_key_id => ENV['S3_ACCESS_KEY'],
      :aws_secret_access_key => ENV['S3_SECRET_KEY'],
    }
    config.storage = :fog
    config.fog_directory = ENV['S3_BUCKET']
  end
end

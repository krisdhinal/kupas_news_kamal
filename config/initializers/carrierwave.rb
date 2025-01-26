CarrierWave.configure do |config|
    config.storage = :file # Gunakan penyimpanan file di folder public/uploads
    config.store_dir = 'uploads' 
end
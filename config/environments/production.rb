Partiude::Application.configure do
  config.cache_classes = true
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true
  config.serve_static_assets = false
  config.assets.compress = true
  config.assets.compile = false
  config.assets.precompile += ['itinerary.form.js']
  config.assets.digest = true
  config.i18n.fallbacks = true
  config.active_support.deprecation = :notify
end

attach_options = {}
attach_options[:url] = ":s3_domain_url"
attach_options[:storage] = :s3
attach_options[:s3_permissions] = "public-read"
attach_options[:s3_credentials] = {
  :bucket => ENV['AWS_BUCKET'],
  :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
  :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
}

Paperclip::Attachment.default_options.update(attach_options)

attach_options = {}
attach_options[:default_url] = ActionController::Base.helpers.asset_path('missing_:style.png', :digest => false)
attach_options[:path] = "users/avatars/:id_partition/:style/:normalized_filename"

Paperclip::Attachment.default_options.update(attach_options)

Paperclip.interpolates :normalized_filename do |attachment, style_name|
  Paperclip::Interpolations.filename(attachment, style_name).gsub( /[^a-zA-Z0-9_\.]/, '-')
end

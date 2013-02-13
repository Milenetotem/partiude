attach_options = {}
attach_options[:url] = "/attachments/:attachment/:id_partition/:style/:normalized_filename"
attach_options[:default_url] = ActionController::Base.helpers.asset_path('missing_:style.png')

Paperclip::Attachment.default_options.update(attach_options)

Paperclip.interpolates :normalized_filename do |attachment, style_name|
  Paperclip::Interpolations.filename(attachment, style_name).gsub( /[^a-zA-Z0-9_\.]/, '_')
end

# frozen_string_literal: true

activate :external_pipeline,
         name: :webpack,
         command: 'npm run production',
         source: 'build'

activate :asset_hash, exts: %w[.jpg .png]

activate :minify_html do |html|
  html.remove_quotes = true
  html.remove_intertag_spaces = true
  html.remove_http_protocol = false
end

set :protocol, 'https://'
set :host, 'advanced-bt.com'
set :port, 80

require_relative '../lib/build'

after_build { adjust_final_source }

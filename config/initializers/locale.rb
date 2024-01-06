# where the I18n library should search for translation files
I18n.load_path += Dir[Rails.root.join('lib', 'locale', '*.{rb,yml}')]

# set the default locale to something other than :en
I18n.default_locale = :'pt-BR'
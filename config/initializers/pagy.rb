# Bootstrap extra: Add nav, nav_js and combo_nav_js helpers and templates for Bootstrap pagination
# See https://ddnexus.github.io/pagy/extras/bootstrap
require 'pagy/extras/bootstrap'


# UIkit extra: Add nav helper and templates for UIkit pagination
# See https://ddnexus.github.io/pagy/extras/uikit
# require 'pagy/extras/uikit'

# Multi size var used by the *_nav_js helpers
# See https://ddnexus.github.io/pagy/extras/navs#steps
# Pagy::VARS[:steps] = { 0 => [2,3,3,2], 540 => [3,5,5,3], 720 => [5,7,7,5] }   # example

# Rails

# Rails: extras assets path required by the helpers that use javascript
# (pagy*_nav_js, pagy*_combo_nav_js, and pagy_items_selector_js)
# See https://ddnexus.github.io/pagy/extras#javascript
# Rails.application.config.assets.paths << Pagy.root.join('javascripts')


# I18n

# Pagy internal I18n: ~18x faster using ~10x less memory than the i18n gem
# See https://ddnexus.github.io/pagy/api/frontend#i18n
# Notice: No need to configure anything in this section if your app uses only "en"
# or if you use the i18n extra below
#
# Examples:
# load the "de" built-in locale:
# Pagy::I18n.load(locale: 'de')
#
# load the "de" locale defined in the custom file at :filepath:
# Pagy::I18n.load(locale: 'de', filepath: 'path/to/pagy-de.yml')
#
# load the "de", "en" and "es" built-in locales:
# (the first passed :locale will be used also as the default_locale)
# Pagy::I18n.load({locale: 'de'},
#                 {locale: 'en'},
#                 {locale: 'es'})
#
# load the "en" built-in locale, a custom "es" locale,
# and a totally custom locale complete with a custom :pluralize proc:
# (the first passed :locale will be used also as the default_locale)
# Pagy::I18n.load({locale: 'en'},
#                 {locale: 'es', filepath: 'path/to/pagy-es.yml'},
#                 {locale: 'xyz',  # not built-in
#                  filepath: 'path/to/pagy-xyz.yml',
#                  pluralize: lambda{|count| ... } )


# I18n extra: uses the standard i18n gem which is ~18x slower using ~10x more memory
# than the default pagy internal i18n (see above)
# See https://ddnexus.github.io/pagy/extras/i18n
# require 'pagy/extras/i18n'

# Default i18n key
# Pagy::VARS[:i18n_key] = 'pagy.item_name'   # default
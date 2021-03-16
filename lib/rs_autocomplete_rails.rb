require 'rs_autocomplete_rails/engine'
require 'rs_autocomplete_rails/controller'

# Top level module of autocomplete_rails,
module RsAutocompleteRails
end

ActionController::Base.send(:include, RsAutocompleteRails::Controller)

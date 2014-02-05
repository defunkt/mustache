# -*- coding: utf-8 -*-
$LOAD_PATH.unshift File.dirname(__FILE__) + '/../lib'
require 'i18n'
require 'mustache'

I18n.backend.store_translations(
  :en,
  :mustache => {
    :title => 'Bear > Shark',
    :body => '<p>Unless the shark has {{item}}.</p>'
  },
  :mustache_alternate => {
    :title => 'Bear > Smaller Bear',
    :body => '<p>Duh.</p>'
  }
)

I18n.backend.store_translations(
  :es,
  :mustache => {
    :title => 'Oso > Tiburón',
    :body => '<p>A menos que el tiburón tiene {{item}}.</p>'
  }
)

class Translation < Mustache
  self.path = File.dirname(__FILE__)

  def item
    'laser beams'
  end

  def exclamation
    "PEW PEW!"
  end

end

if $0 == __FILE__
  puts Translation.to_html
end

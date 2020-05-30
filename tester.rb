$:.push('./lib')
require 'placeholder-parser'

puts PlaceholderParser::Android.identify('Foo %6.0E bar').inspect

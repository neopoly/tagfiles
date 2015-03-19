[github]: https://github.com/neopoly/tagfiles
[doc]: http://rubydoc.info/github/neopoly/tagfiles/master/file/README.md
[gem]: https://rubygems.org/gems/tagfiles
[gem-badge]: https://img.shields.io/gem/v/tagfiles.svg
[travis]: https://travis-ci.org/neopoly/tagfiles
[travis-badge]: https://img.shields.io/travis/neopoly/tagfiles.svg?branch=master
[codeclimate]: https://codeclimate.com/github/neopoly/tagfiles
[codeclimate-climate-badge]: https://img.shields.io/codeclimate/github/neopoly/tagfiles.svg
[codeclimate-coverage-badge]: https://codeclimate.com/github/neopoly/tagfiles/badges/coverage.svg
[inchpages]: https://inch-ci.org/github/neopoly/tagfiles
[inchpages-badge]: https://inch-ci.org/github/neopoly/tagfiles.svg?branch=master&style=flat

# Tagfiles

[![Travis][travis-badge]][travis]
[![Gem Version][gem-badge]][gem]
[![Code Climate][codeclimate-climate-badge]][codeclimate]
[![Test Coverage][codeclimate-coverage-badge]][codeclimate]
[![Inline docs][inchpages-badge]][inchpages]

[Gem][gem] |
[Source][github] |
[Documentation][doc]

Tagfiles provides the `tagfile` helper for Rails.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tagfiles'
```

And then execute:

    $ bundle

## Basic Usage

Tagfile: `app/views/tagfiles/_box.html.haml`

```haml
.box
  %h2= title
  %p= yield
```

HAML file using `box` tagfile: `app/views/admin/page/index.html.haml`

```haml
= tf :box, title: "Box title"
  Some box content
```

See [examples/](https://github.com/neopoly/tagfiles/tree/master/examples) and [specs](https://github.com/neopoly/tagfiles/blob/master/spec/integration/rails_spec.rb) for more examples.

## Lookup order

Rendering the `box` tagfile from the example above will trigger with following lookups:

* `app/views/admin/page/tagfiles/_box.html.erb`
* `app/views/admin/tagfiles/_box.html.erb`
* `app/views/tagfiles/_box.html.erb`

## Rails support

Following Rails version are supported
* 4.2
* 4.1
* 4.0
* 3.2

Feel free to test with earlier Rails versions. Feedback is welcome!

## Contributing

1. [Fork it](https://github.com/neopoly/tagfiles/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

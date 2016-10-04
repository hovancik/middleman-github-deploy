[![Build Status](https://travis-ci.org/hovancik/middleman-github-deploy.svg)](https://travis-ci.org/hovancik/middleman-github-deploy)
[![Gem Version](https://badge.fury.io/rb/mgd.svg)](http://badge.fury.io/rb/mgd)
[![Dependency Status](https://gemnasium.com/hovancik/middleman-github-deploy.svg)](https://gemnasium.com/hovancik/middleman-github-deploy)

# What is mgd ?

mgd stands for middleman-github-deploy and is a fork of [jgd](https://github.com/yegor256/jekyll-github-deploy).  

mgd will automatically build your Middleman blog and push it to your gh-pages
branch (or any other branch of your choice).

## Ruby versions
Everything should work fine with ruby > 2.0.

There is a bug with rubygems (https://github.com/rubygems/rubygems/issues/1420), so if you're getting error like this:

```
$ mgd
/Users/user/.rvm/rubies/ruby-2.3.1/lib/ruby/2.3.0/rubygems/specification.rb:2158:in `method_missing': undefined method `this' for #<Gem::Specification:0x3fc9e849c75c trollop-2.1.2> (NoMethodError)
        from /Users/user/.rvm/rubies/ruby-2.3.1/lib/ruby/2.3.0/rubygems/specification.rb:1057:in `find_active_stub_by_path'
        from /Users/user/.rvm/rubies/ruby-2.3.1/lib/ruby/2.3.0/rubygems/core_ext/kernel_require.rb:64:in `require'
        from /Users/user/.rvm/gems/ruby-2.3.1@gemset/gems/mgd-0.1.0/bin/mgd:4:in `<top (required)>'
        from /Users/user/.rvm/gems/ruby-2.3.1@gemset/bin/mgd:23:in `load'
        from /Users/user/.rvm/gems/ruby-2.3.1@gemset/bin/mgd:23:in `<main>'
        from /Users/user/.rvm/gems/ruby-2.3.1@gemset/bin/ruby_executable_hooks:15:in `eval'
        from /Users/user/.rvm/gems/ruby-2.3.1@gemset/bin/ruby_executable_hooks:15:in `<main>'

```

check what is your gem version, should be higher than 2.6.3:

```
$ gem --version
```

you can update it via: 

```
$ gem update --system  # you might need to be an administrator or root
```

# Installation and Usage

It is assumed that your blog is in the home directory of your repo.

Install it first:

```bash
gem install mgd
```

Run it locally:

```bash
mgd
```

Now your site is deployed to `gh-pages` branch of your repo. Done.

PS. You can also specify target branch, with is `gh-pages` by default. Use
`--branch` command line option.

# Deploying with Travis

This is how you might configure your blog
to be deployed automatically by [travis-ci](http://www.travis-ci.org):

```yaml
branches:
  only:
    - master
env:
  global:
    - secure: ...
install:
  - bundle
script: mgd -u http://yourname:$PASSWORD@github.com/yourname/blog.git
```

The environment variable `$PASSWORD` is set through
`env/global/secure`, as explained
[here](http://docs.travis-ci.com/user/encryption-keys/).

Don't forget to add `gem require 'mgd'` to your `Gemfile`.

You can use SSH key instead. First, you should [encrypt](https://docs.travis-ci.com/user/encrypting-files/) it:

```bash
$ travis encrypt-file id_rsa --add
```

Then, use the URI that starts with `git@`:

```yaml
script:
  - mgd -u git@github.com:yourname/blog.git
```

Read also [this article](http://www.yegor256.com/2014/06/22/jekyll-github-deploy.html).

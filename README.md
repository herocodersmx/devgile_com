# [DevGile.com](http://www.devgile.com)

For this website, we are using [Middleman](https://middlemanapp.com/), which is:

> a static site generator using all the shortcuts and tools in modern web development. 

If you want to read more information visit the [Middleman docs](https://middlemanapp.com/advanced/configuration/).


### Requirements

- Ruby: `2.2.0`
- rbEnv: `> 0.4.0`
- Bundler: `> 1.7.13`


### Instructions:

_(you can Copy & Paste the following code in your Terminal)_

```sh
# Clone project from GitHub
git clone git@github.com:devgile/devgile_com.git ./devgile
cd devgile

# Install Bundler
gem install bundler --no-ri --no-rdoc
rbenv rehash

# Start Middleman server
middleman server

# By default, the server runs with port "4567", open it in your browser:
open http://localhost:4567
```

### Generate Static website

After all the changes, you will need to export your website as Static pages.

Execute this in your Terminal:

```sh
middleman build
```

This will generate all the static files in the `build` directory, ready to be used 

### Using Pow as your web server

If you use [Pow](http://pow.cx), you can use it as your Middleman server:

```sh
# Link application
powder link
powder restart
powder open
```

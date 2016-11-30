WPLOCAL
======

WPLOCAL is a command-line tool for creating and managing very fast local WordPress installations. You can create an instante in merely 8 seconds with its dedicated folder and database, without using any complicated or cumbersome platform such as Docker or Vagrant. Instead, it uses [Laravel Valet](https://laravel.com/docs/5.3/valet) (which uses [Caddy](https://caddyserver.com) and [DNSMasq](https://en.wikipedia.org/wiki/Dnsmasq)), MariaDB, the mighty [wp-cli](http://wp-cli.org) and PHP7 libraries all through composer and brew package managers.

For the latest news on this project, follow [@hellodevapps on Twitter](https://twitter.com/hellodevapps) or [visit my blog](http://schmitzoi.de). There will be a roadmap soon here for an overview of what's planned for upcoming releases, and also with directions on how to contribute to this project and where to work on first. THERE'S A LOT TO DO! For now, I just want to test this out and get a grip of how it is working as a basic simple and very useful tool and take it to higher levels such us remote instance replications, cloning, local sharing, automatic publications and more.

All this comes out of our daily working day at [hellodev](https://hellodev.us), a WordPress specialised agency from Porto, Portugal, as a contribution to the community. Please use and abuse!

## Using

WPLOCAL goal is to provide a command-line interface for creating a local WordPress installation with one simple line: `wplocal create -w mysite`. This will create a folder named mysite, and in it, the latest WordPress release with a database called `mysite`, and a running site at `http://mysite.dev`.

```bash
$ wplocal create -w mysite
Going to install WordPress on folder /Users/marcelschmitz/Documents/Websites/mysite accessible at http://mysite.dev...
Creating folder...
Installing WordPress here...
Downloading WordPress 4.6.1 (en_US)...
Using cached file '/Users/marcelschmitz/.wp-cli/cache/core/wordpress-4.6.1-en_US.tar.gz'...
Success: WordPress downloaded.
✔︎ Done
Creating database...
Starting MySQL
.161129 23:44:48 mysqld_safe Logging to '/usr/local/var/mysql/Marcels-iMac.local.err'.
 SUCCESS!
✔︎ Done
Configuring WordPress...
Success: Generated 'wp-config.php' file.
Starting Valet...
A [mysite] symbolic link has been created in [/Users/marcelschmitz/.valet/Sites/mysite].
✔︎ All Done!
✔︎ Installed
```

This created the above install in 8 seconds! You can very quickly undo this, delete everything created by the command line with this simple command:

```bash
$ wplocal destroy -w mysite
Going to uninstall website on folder /Users/marcelschmitz/Documents/Websites/mysite and delete the database. Proceed? (y)es / (n)o
y
Deleting database...
Starting MySQL
 SUCCESS!
✔︎ Done
Deleting folder...
161129 23:46:32 mysqld_safe Logging to '/usr/local/var/mysql/Marcels-iMac.local.err'.
✔︎ Done
```

This took 1 second to complete. It is really just that simple.

## Installing

To install this command-line tool you'll need to download the .rb file and install it as a executable inside your Mac OS(x) platform.

Minimum requirements are an OS X operating system, 10.8 or greater. Sorry, no Linux or UNIX support yet. More on that later!

When you're ready you can download the file using `wget` or `curl`:

```bash
$ curl -O https://raw.githubusercontent.com/hellodevapps/wplocal/builds/master/wplocal.rb
```

Next, check if it is working:

```bash
$ ./wplocal.rb version
```

To use WPLOCAL from the command line by typing `wplocal`, make the file executable and move it to the executable path in your sytem like this:

```bash
$ chmod +x wplocal.rb
$ sudo mv wplocal.rb /usr/local/bin/wplocal
```

If it all went ok (no reason not to), execute  `wplocal version` and expect something like this to come out:

```bash
$ wplocal version
v0.1 by Marcel Schmitz @schmitzoide hellodev.us
```

As a final step, you need to install all the components that WPLOCAL needs to run. Well, you just need to type a command, WPLOCAL will do all the dirty work for you:

```bash
$ wplocal setup
Going to check for installed compoments...


## Checking for Brew
Homebrew 1.1.1
Homebrew/homebrew-core (git revision 6058; last commit 2016-11-22)
✔︎ Check


## Checking for Composer
Composer version 1.2.2 2016-11-03 17:43:15
✔︎ Check


## Checking for MySQL
mysql  Ver 15.1 Distrib 10.1.19-MariaDB, for osx10.12 (x86_64) using readline 5.1
✔︎ Check


## Checking for Laravel Valet
Laravel Valet version 1.1.22
✔︎ Check


## Checking for WP-CLI
WP-CLI 0.25.0
✔︎ Check


## Checking for dependencies
Going to install...
GEM dependencies...
✔︎ Installed


Pinging .dev...
PING *.dev (127.0.0.1): 56 data bytes
64 bytes from 127.0.0.1: icmp_seq=0 ttl=64 time=0.078 ms

--- *.dev ping statistics ---
1 packets transmitted, 1 packets received, 0.0% packet loss
round-trip min/avg/max/stddev = 0.078/0.078/0.078/0.000 ms

✔︎ ALL GOOD! Hurray!

CD into the dir where you want to install your local WordPress website and run `wplocal create -w NAME_OF_SITE`
```

### Updating

Well, this is probably the first thing to do if you want to contribute, build the update command. Shouldn't be difficult, right? Want to do it? Otherwise, repeat the install process with the newest release.

### More commands

To checkout what else WPLOCAL can do (not that much yet), just type `wplocal`and hit ENTER.


## Contributing

This is our first project on Github, open to the public, embracing all kinds of contributions to make this project get somewhere. Therefore, it is with a great pleasure that I invite YOU dearly to contribute! We need your support! Not only to write code, but also to test it and criticise and suggest new features and break it for us to fix it.

This is yours! This is ours!


## Credits

All the libraries used for this tool to work are done by a tone of awesome, out of the world, developers which contribution is why we exist today as developers that we are. The only thing we've done (actually, Marcel did it) is to code the wplocal.rb which we hope we can expand and start adding some names here. So for now, we thank your CTO for making our lives a tiny bit easier:

[Marcel Schmitz](https://schmitzoi.de) 

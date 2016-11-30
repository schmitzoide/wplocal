#!/usr/bin/env ruby

require 'optparse'
require 'json'
require 'date'
require 'fileutils'
require 'rubygems'


#### OTHER CLASSES


class String
  # colorization
  def colorize(color_code)
    "\e[#{color_code}m#{self}\e[0m"
  end

  def red
    colorize(31)
  end

  def green
    colorize(32)
  end

  def yellow
    colorize(33)
  end

  def blue
    colorize(34)
  end

  def pink
    colorize(35)
  end

  def light_blue
    colorize(36)
  end
end

def help
    puts "wplocal - a simple script that helps you create a local WordPress development using Laravel Valet, MariaDB, PHP7, wp-cli and other optional components.".red
    puts "\twplocal setup\t\t- check for installed components, if not available, installs them";
    puts "\twplocal create\t\t- installs a WordPress website and database, expexts -w parameter";
    puts "\twplocal destroy\t\t- uninstalls a WordPress website, deletes folder and drops database, expexts -w parameter";
    puts "\twplocal fix\t\t- should fix any instalation problem with valet";
    puts "\twplocal version\t\t- show version info";

end

def destroy (cmd)

	site = cmd.to_s
	current = Dir.pwd

	puts 'Going to uninstall website on folder ' + current + '/' + site + ' and delete the database. Proceed? (y)es / (n)o'
	input = STDIN.gets.chomp
	if (input == "yes" or input == "y")
		puts 'Deleting database...'.yellow
		system("mysql.server start && mysql -u root -e 'drop database " + site + " '");
		if $?.exitstatus != 0
	       puts "✖︎︎ Error deleting database, aborting :-(".red
	       abort
		end
		puts "✔︎ Done".green
		puts 'Deleting folder...'.yellow
		system("cd " + current + " && rm -r " + site);
		if $?.exitstatus != 0
	       puts "✖︎︎ Error deleting database, aborting :-(".red
	       abort
		end
		puts "✔︎ Done".green
	else
		puts "✔︎ Aborted, nothing done.".green
	end
end

def create (cmd)

	site = cmd.to_s
	current = Dir.pwd

	puts 'Going to install WordPress on folder ' + current + '/' + site + ' accessible at http://' + site + '.dev...'

	puts 'Creating folder...'.yellow
	system ("mkdir -p " + current + "/" + site)
	if $?.exitstatus != 0
       puts "✖︎︎ Error creating dir :-(".red
       abort
	end

    puts 'Installing WordPress here...'.yellow
	system("cd " + current + "/" + site + " && wp core download")
	if $?.exitstatus != 0
       puts "✖︎︎ Error downloading latest version of WordPress :-(".red
       abort
	end
	puts "✔︎ Done".green
	puts 'Creating database...'.yellow
	system("mysql.server start && mysql -u root -e 'create database " + site + "'")
	if $?.exitstatus != 0
       puts "✖︎︎ Error creating database :-(".red
       abort
	end
	puts "✔︎ Done".green
	puts 'Configuring WordPress...'.yellow
	system("cd " + current + "/" + site + " && wp core config --dbname='" + site + "' --dbuser='root' --dbhost='localhost'")
	if $?.exitstatus != 0
       puts "✖︎︎ Error creating wp-config.php :-(".red
       abort
	end
	puts 'Starting Valet...'.yellow
	system("cd " + current + "/" + site + " && valet link " + site)
	if $?.exitstatus != 0
       puts "✖︎︎ Error creating wp-config.php :-(".red
       abort
	end
	puts "✔︎ All Done!".green
	system ("open http://" + site + ".dev")

	if $?.exitstatus == 0
	   puts "✔︎ Installed".green
	else
       puts "✖︎︎ Not installed".red
	end

end


def install (mod)

	puts 'Going to install...'

    case mod
    when "valet"
		puts 'Laravel Valet...'.yellow
		system("export PATH=\"$PATH:$HOME/.composer/vendor/bin\"")		
        system("export PATH=\"$PATH:$HOME/.composer/vendor/bin\"")
        system("sudo apachectl stop")
		system("composer global require laravel/valet")
		if $?.exitstatus == 0
			system("valet install")
            system("valet start")
		   puts "✔︎ Installed".green
		else
	       puts "✖︎︎ Not installed".red
		end

    when "composer"
		puts 'Composer...'.yellow
		system("curl -sS https://getcomposer.org/installer | php")
		system("sudo mv composer.phar /usr/local/bin/composer")
		if $?.exitstatus == 0
		   puts "✔︎ Installed".green
		else
	       puts "✖︎︎ Not installed".red
		end
    when "mariadb"
		puts 'MariaDB...'.yellow
		system("brew install mariadb")
		system("mysql.server start")
		if $?.exitstatus == 0
		   puts "✔︎ Installed".green
		else
	       puts "✖︎︎ Not installed".red
		end
    when "brew"
		puts 'Homebrew...'.yellow
		system('/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"')
		if $?.exitstatus == 0
		   puts "✔︎ Installed".green
		else
	       puts "✖︎︎ Not installed".red
		end
    when "wpcli"
		puts 'WP-CLI'.yellow
		system('curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar')
		system('chmod +x wp-cli.phar')
		system('sudo mv wp-cli.phar /usr/local/bin/wp')
		if $?.exitstatus == 0
		   puts "✔︎ Installed".green
		else
	       puts "✖︎︎ Not installed".red
		end
    when "dep"
		puts 'GEM dependencies...'.yellow
		if $?.exitstatus == 0
		   puts "✔︎ Installed".green
		else
	       puts "✖︎︎ Not installed".red
		end
    end

end

def uninstall

    system 'clear'
    cp puts ' '

    puts 'Going to uninstall everything component wplocal installed and delete the databases. Proceed? (y)es / (n)o'
    input = STDIN.gets.chomp
    if (input == "yes" or input == "y")
        system("valet uninstall")
        system("composer global remove laravel/valet")
        system("mysql.server stop")
        system("brew remove mariadb")
        system("brew cleanup")
        system("sudo rm /usr/local/bin/composer")
        system("sudo rm -r ~/.composer")
        puts "✔︎ Uninstalled. Thanks for trying wplocal!".green
    else
        puts "✖︎︎ Aborted".red
    end

end

def setup

	system 'clear'

	puts ' '
	puts 'Going to check for installed compoments...'.yellow
	puts ' '
	puts ' '
	puts '## Checking for 🍺 Brew'.yellow
	system("brew -v")
	if $?.exitstatus == 0
		   puts "✔︎ Check".green
		   puts "Update available?".yellow
		   system("brew update")
	else
	   puts "✖︎︎ Not installed".red
	   install 'brew'
	end
	puts ' '
	puts ' '
	puts '## Checking for Composer'.yellow
	system("composer --version")
	if $?.exitstatus == 0
		   puts "✔︎ Check".green
	else
	   puts "✖︎︎ Not installed".red
	   install 'composer'
	end
    puts ' '
	puts ' '
	puts '## Checking for MySQL'.yellow
	system("mysql -V")
	if $?.exitstatus == 0
		   puts "✔︎ Check".green
	else
	   puts "✖︎︎ Not installed".red
	   install 'mariadb'
	end
	puts ' '
	puts ' '
	puts '## Checking for Laravel Valet'.yellow
	system("valet -V")
	if $?.exitstatus == 0
		puts "✔︎ Check".green
	else
	   puts "✖︎︎ Not installed".red
	   install 'valet'
	end
	puts ' '
	puts ' '
	puts '## Checking for WP-CLI'.yellow
	system("wp --version")
	if $?.exitstatus == 0
		puts "✔︎ Check".green
	else
	   puts "✖︎︎ Not installed".red
	   install 'wpcli'
	end
	puts ' '
	puts ' '
	puts '## Checking for dependencies'.yellow
	install 'dep'
	puts ' '
	puts ' '
	puts 'Pinging .dev...'.yellow
	system('ping -c 1 *.dev')
	puts ' '
	puts "✔︎ ALL GOOD! Hurray!".green
	puts ' '
	puts "CD into the dir where you want to install your local WordPress website and run `wplocal create -w NAME_OF_SITE`".green

end

def fix

	system 'clear'

	puts ' '
	puts 'Fixing instalation (if eventually asked for root access, please proceed)...'.green
	puts ' '
	puts ' '
	begin
		system("sudo apachectl stop")
        system("export PATH=\"$PATH:$HOME/.composer/vendor/bin\"")
		system("composer global remove laravel/valet ")
		system("composer global require laravel/valet")
		system("valet install")
		system("valet start")
	rescue
		system("composer global remove laravel/valet")
		system("composer global require laravel/valet")
		system("valet install")
		system("valet start")
	end
	puts "✔︎ ALL GOOD! Hurray!".green

end


# ARGUMENTS AND OPTIONS TO THE COMMAND

def parse_options
  options = {}
  case ARGV[1]
  when "-p"
    options[:p] = ARGV[2]
  when "-w"
	options[:w] = ARGV[2]
  end
  options
end

v1 = ARGV[0]

case v1
when "setup"
	setup
when "uninstall"
    uninstall
when "create"
	if !parse_options[:w]
		puts "parameter -w (for website) is missing :-(".red
		abort
	end
	create parse_options[:w]
when "destroy"
	if !parse_options[:w]
		puts "parameter -w (for website) is missing :-(".red
		abort
	end
	destroy parse_options[:w]
when "fix"
	fix
when "help"
	help
when "version"
	puts 'v0.1'.green + ' by Marcel Schmitz'.blue + ' @schmitzoide'.yellow	 + ' hellodev.us'.red
else
	help
end

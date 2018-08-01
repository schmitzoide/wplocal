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
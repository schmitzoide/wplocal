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
    puts '## Updating everything to the latest version'.yellow
    system("composer global update")
	if $?.exitstatus == 0
		puts "✔︎ Check".green
	else
	    puts "✖︎? Unable to update...".red
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
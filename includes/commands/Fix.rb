def fix

	system 'clear'

	puts ' '
	puts 'Fixing instalation (if eventually asked for root access, please proceed)...'.green
	puts ' '
	puts ' '
	begin
		system("sudo apachectl stop")
        system("export PATH=\"$PATH:$HOME/.composer/vendor/bin\"")
		system("composer global remove laravel/valet")
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
def create (cmd)

	site = cmd.to_s
	current = Dir.pwd

	puts 'Going to install WordPress on folder ' + current + '/' + site + ' accessible at http://' + site + '.test...'

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
	system("cd " + current + "/" + site + " && valet link " + site + " --secure")
	if $?.exitstatus != 0
       puts "✖︎︎ Error creating wp-config.php :-(".red
       abort
	end
	puts "✔︎ All Done!".green
	system ("open http://" + site + ".test")

	if $?.exitstatus == 0
	   puts "✔︎ Installed".green
	else
       puts "✖︎︎ Not installed".red
	end

end
def destroy (cmd)

	site = cmd.to_s
	current = Dir.pwd

	puts 'Going to uninstall website on folder ' + current + '/' + site + ' and delete the database. Proceed? (y)es / (n)o'
	input = STDIN.gets.chomp
	if (input == "yes" or input == "y")
		puts 'Delete link to folder...'.yellow
		system("valet unlink " + site);
		if $?.exitstatus != 0
            puts "✖︎︎ Error unlinking site, aborting :-(".red
            abort
         end
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
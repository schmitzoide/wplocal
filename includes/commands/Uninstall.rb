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
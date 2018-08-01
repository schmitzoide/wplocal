def help
    puts "wplocal - a simple script that helps you create a local WordPress development using Laravel Valet, MariaDB, PHP7, wp-cli and other optional components.".red
    puts "\twplocal setup\t\t- check for installed components, if not available, installs them";
    puts "\twplocal create\t\t- installs a WordPress website and database, expexts -w parameter";
    puts "\twplocal destroy\t\t- uninstalls a WordPress website, deletes folder and drops database, expexts -w parameter";
    puts "\twplocal fix\t\t- should fix any instalation problem with valet";
    puts "\twplocal version\t\t- show version info";
end
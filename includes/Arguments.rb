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
      puts 'v0.2'.green + ' by Marcel Schmitz'.blue + ' @schmitzoide'.yellow	 + ' hellodev.us'.red
  else
      help
  end
  
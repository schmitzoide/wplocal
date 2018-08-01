#!/bin/bash
# file: install.sh

file="wplocal.rb"
if [ ! -f "$file" ]
then
    rm wplocal.rb
fi

touch wplocal.rb
cat start.rb >> wplocal.rb 
echo '' >> wplocal.rb 
echo '' >> wplocal.rb 
cat classes/String.rb >> wplocal.rb
echo '' >> wplocal.rb 
cat includes/commands/Setup.rb >> wplocal.rb
echo '' >> wplocal.rb 
cat includes/commands/Fix.rb >> wplocal.rb
echo '' >> wplocal.rb 
cat includes/commands/Install.rb >> wplocal.rb
echo '' >> wplocal.rb 
cat includes/commands/Uninstall.rb >> wplocal.rb
echo '' >> wplocal.rb 
cat includes/commands/Create.rb >> wplocal.rb
echo '' >> wplocal.rb 
cat includes/commands/Destroy.rb >> wplocal.rb
echo '' >> wplocal.rb 
cat includes/commands/Help.rb >> wplocal.rb
echo '' >> wplocal.rb 
cat includes/Arguments.rb >> wplocal.rb

chmod +x wplocal.rb
sudo mv wplocal.rb /usr/local/bin/wplocal
wplocal version
echo "ALL DONE!"

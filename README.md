# Sparrowdo::Cordova::OSx::Build

Sparrowdo module to build cordova project for OSx.

    $ cat sparrowfile

    module_run "Cordova::OSx::Build", %(
      team-id => "AAF04QW46Z" # team id
      keychain-password => "pAsSword" # password to access key chain 
    );

    $ cd /path/to/cordova/project/

    $ sparrowdo --local_mode --no_sudo --cwd=$PWD

# Author

Alexey Melezhik


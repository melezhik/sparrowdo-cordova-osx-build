# Sparrowdo::Cordova::OSx::Build

Sparrowdo module to build cordova project for OSx.

# USAGE

    $ zef install --/test https://github.com/melezhik/sparrowdo-cordova-osx-build.git --force-install

    $ sparrowdo --local_mode --no_sudo  \
    --cwd=/path/to/cordova/project \
    --module_run=Cordova::OSx::Build@team-id=AABBCCDDEE;keychain-password => "pAsSword"

# Parameters

## team-id

Your apple team ID.

## keychain-password

Password to unlock keychain access. Optional.


# Author

Alexey Melezhik


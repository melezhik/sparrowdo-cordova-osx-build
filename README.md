# Sparrowdo::Cordova::OSx::Build

Sparrowdo module to build cordova project for OSx.

# USAGE

    $ zef install Sparrowdo::Cordova::OSx::Build

    $ sparrowdo --local_mode --no_sudo --cwd=/path/to/cordova/project \
    --module_run=Cordova::OSx::Build@team-id=AABBCCDDEE;keychain-password => "pAsSword"

# Parameters

## team-id

Your apple team ID.

## keychain-password

Password to unlock keychain access. Optional.

## skip-pod-setup

Skip `pod setup` command:

    skip-pod-setup=1

## manual-signing

If set creates manual signed build with given provisioning profile:

    sparrowdo --local_mode --no_sudo --module_run=Cordova::OSx::Build@team-id=72F84QW26V,\
    profile=afdc3c04-ba2d-4817-1a97-62d810e4c5ac,\
    manual-signing=OK

## profile

Sets provisioning profile, see `manual-signing` parameter.


# Author

Alexey Melezhik


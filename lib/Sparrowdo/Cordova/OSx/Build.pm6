use v6;

unit module Sparrowdo::Cordova::OSx::Build:ver<0.0.3>;

use Sparrowdo;
use Sparrowdo::Core::DSL::Template;
use Sparrowdo::Core::DSL::Directory;
use Sparrowdo::Core::DSL::Bash;

our sub tasks (%args) {

    my $keychain-password = %args<keychain-password>;

    directory "www";
    
    bash "npm install --silent";
    
    bash "npm install --silent ionic";
    
    bash "npm install --silent cordova";
    
    bash "npm install --silent ios-deploy";
    
    bash "pod setup 1>/dev/null", %(
      envvars => %(
        LANG => "en_US.UTF-8"
      )
    );

    if %args<configure-command> {
      bash %args<configure-command>, %(
        description => "configure",
        debug => 1,
      )
    }

    bash "npm run --silent cordova -- platform add ios";
    
    bash "npm run --silent cordova -- prepare ios";
    
    bash "npm run cordova -- requirements ios";
    
    bash "rm -rfv ./platforms/ios/build/device/*.ipa";

    if $keychain-password {
      bash "security unlock-keychain -p $keychain-password ~/Library/Keychains/login.keychain-db", %(
        description => "security unlock-keychain -p ****** ~/Library/Keychains/login.keychain-db"
      );
    }

    bash "npm run --silent ionic -- cordova build ios --device -- --buildFlag='DEVELOPMENT_TEAM={%args<team-id>}' --buildFlag='-allowProvisioningUpdates'", %(
      expect_stdout => 'EXPORT SUCCEEDED',
      debug => 1,
      description => "cordova build"
    );
    
    bash "ls -l platforms/ios/build/device";
    
    bash 'find . -type f -name "*.ipa" | wc -l', %( expect_stdout => 1 );
    
}



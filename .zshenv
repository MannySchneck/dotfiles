export PEER_APPLICATION_ID=test
export PEER_SECRET=secret

alias buildall="scripts/build.sh -m AllBuild -g Ninja -b Debug"

alias configpeer="scripts/configure.sh -m Peer -g Ninja -b Debug"
alias configall="scripts/configure.sh -m AllBuild -g Ninja -b Debug"

alias rebuildpeer="configall && scripts/build.sh -m AllBuild -g Ninja -b Debug -t PeerExe"
alias buildpeer="scripts/build.sh -m AllBuild -g Ninja -b Debug -t PeerLibraryTest"

alias buildtarget="scripts/build.sh -m AllBuild -g Ninja -b Debug -t"

alias pingme="terminal-notifier -sound default -message"


if [ -e /Users/mannyschneck/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/mannyschneck/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

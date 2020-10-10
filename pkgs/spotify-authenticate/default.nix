{
  stdenv,
  buildGoModule,
  fetchFromGitHub
}:

buildGoModule rec {
  pname = "spotify-authenticate";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "tinybeachthor";
    repo = pname;
    rev = version;
    sha256 = "0ps85m6v8av2pkj2f3mj6gw3y7pwlyihrh75vfm38aw29x3cacf8";
  };

  modSha256 = "19vi6d3y209apzjzn6kvivd392vki060y974x88ysc58v088d8ma";

  subPackages = [ "." ];

  meta = with stdenv.lib; {
    description = "Get Spotify oauth refreshable access-token";
    homepage = https://github.com/tinybeachthor/spotify-authenticate;
    license = licenses.unlicense;
    maintainers = [ ];
    platforms = platforms.linux;
  };
}


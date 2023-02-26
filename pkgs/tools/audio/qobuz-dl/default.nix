{ lib
, stdenv
, fetchFromGitHub
, python311Packages
}:

python311Packages.buildPythonApplication rec {
  pname = "qobuz-dl";
  version = "2023-02-20-unstable";

  src = fetchFromGitHub {
    owner = "vitiko98";
    repo = "qobuz-dl";
    rev = "95380b6eb131a8af55c2b031dacee93d81a1ad9c";
    hash = "sha256-byO2chqz2f80IEGg8k/3iN16jeHiRePFIO6cz+CLZ+U=";
  };

  postPatch = ''
    substituteInPlace setup.py --replace 'pick==1.6.0' 'pick'
  '';

  propagatedBuildInputs = with python311Packages; [
    pathvalidate
    requests
    mutagen
    tqdm
    pick
    beautifulsoup4
    colorama
  ];

  meta = with lib; {
    description = "A complete Lossless and Hi-Res music downloader for Qobuz";
    homepage = "https://github.com/vitiko98/qobuz-dl";
    license = licenses.gpl3Plus;
    maintainers = with maintainers; [ annaaurora ];
  };
}

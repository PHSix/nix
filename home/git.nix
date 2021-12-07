{ programs, ... }:
{
  programs.git = {
    enable = true;
    userName = "PH";
    userEmail = "15917977183@163.com";
    /* signing = { */
    /*   key = "15917977183@163.com"; */
    /*   signByDefault = true; */
    /* }; */
  };
  programs.gpg = {
    enable = true;
  };
  services.gpg-agent = {
    enable = true;
  };
  # programs.gnupg = { agent.pinentryFlavor = "tty"; enable = true; };
}

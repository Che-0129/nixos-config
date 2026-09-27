{
  programs.ssh = {
    enable = true;
    settings."*".IPQoS = "throughput";
  };
}

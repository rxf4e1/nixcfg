{
  services.syncthing = {
    enable = true;
    user = "user";
    group = "users";
    dataDir = "/home/user/Sync";
    configDir = "/home/user/.config/syncthing";
    openDefaultPorts = true;
    guiAddress = "0.0.0.0:8384";
    overrideDevices = true;
    overrideFolders = false;
    settings = {
      devices = {
        "rx-laptop" = {
          autoAcceptFolders = true;
          id = "K23UAMC-WBGKJHG-TMH2TN2-7XEEBIG-SFDXYXV-EEVTRQZ-PXZDK7L-EPYBJQE";
        };
        "rx-mobile" = {
          autoAcceptFolders = true;
          id = "26VILNJ-EW7IJ3E-KJAGR6Z-CM6Y47U-3ITWC3L-SLGB22F-J2VRCBG-N5EIWAM";
        };
        # "fx-laptop" = { autoAcceptFolders = true; id = ""; };
        # "fx-mobile" = { autoAcceptFolders = true; id = ""; };
        # "nx-backup" = { autoAcceptFolders = true; id = ""; };
      };
      folders = {
        "rx-Private" = {
          devices = [ "rx-mobile" ];
          path = "/home/user/.repos/.private";
          versioning = { type = "simple"; params.keep = "2"; };
        };
        
        # "rx-Documents" = {
        #   devices = [ "sx-lab" ];
        #   path = "/home/rxf4e1/Documents";
        #   versioning = { type = "simple"; params.keep = "2"; };
        # };

        # "nx-Backup" = {
        #   devices = [ "sx-lab" ];
        #   path = "C:\Neuluft";
        #   versioning = { type = "simple"; params.keep = "2"; };
        # };
        
      };
      user = "admin";
      password = "7x7maw1e";
    };
  };
}

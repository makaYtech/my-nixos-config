{
  description = "MSC";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    zapret-discord-youtube.url = "github:kartavkun/zapret-discord-youtube";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, zapret-discord-youtube, ... }@inputs:
    let 
      system = "x86_64-linux";
      hostname = "nixos";
      homeStatrVersion = "25.11";
      user = "maka";
    in {
      nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [ 
          ./configuration.nix
          zapret-discord-youtube.nixosModules.default
            {
              services.zapret-discord-youtube = {
                enable = true;
                config = "general(ALT9)";
                
                # Добавляем кастомные домены в list-general.txt
                listGeneral = [ "example.com" "test.org" "mysite.net" ];
                
                # Добавляем домены в list-exclude.txt (исключения)
                listExclude = [ "ubisoft.com" "origin.com" ];
                
                # Добавляем IP адреса в ipset-all.txt
                ipsetAll = [ "192.168.1.0/24" "10.0.0.1" ];
                
                # Добавляем IP адреса в ipset-exclude.txt (исключения)
                ipsetExclude = [ "203.0.113.0/24" ];
              };
            }
        ];
      };

      homeConfigurations.${user} = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        extraSpecialArgs = {
          inherit inputs user;
        };
        modules = [
          ./home.nix
        ];
      };
    };
}
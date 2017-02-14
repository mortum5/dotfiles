# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];
	
	boot = {
		initrd.checkJournalingFS = false;
		loader.grub = {
			enable = true;
			version = 2;
			device = "/dev/sda";
		};
	};

	programs = {
		zsh.enable = true;
	};

	hardware.pulseaudio.enable = true;	

	nix.extraOptions = ''
		connect-timeout = 10
	'';
	
	services.xserver = {
		enable		= true;
		layout 		= "us,ru";
		xkbOptions      = "grp:ctrl_shift_toggle";
			
		displayManager.lightdm = {
			enable  = true;
		};
		
		windowManager = {
			default = "i3-gaps";
			i3-gaps.enable = true;
		};
	};
	
	users.extraUsers.andrey = {
		createHome  = true;
		home        = "/home/andrey";
		group       = "users";
		extraGroups = [ "wheel" "audio"];
		shell       = "${pkgs.zsh}/bin/zsh";
		uid         = 1000;
	};

	time.timeZone = "Europe/Moscow";
	
	nixpkgs.config = {
		allowUnfree = true;
	};

	environment.systemPackages = with pkgs; [
		git
		htop
		wget
		zsh
		vim
		ranger
	];

	fonts = {
		fontconfig.enable = true;
		enableFontDir = true;
		enableGhostscriptFonts = true;
		fontconfig.defaultFonts.monospace = ["Terminus"];
		fonts = [
			pkgs.corefonts
			pkgs.clearlyU
			pkgs.cm_unicode
			pkgs.dejavu_fonts
			pkgs.freefont_ttf
			pkgs.terminus_font
		];
	};
   
  virtualisation.virtualbox.guest.enable = true;
  system.stateVersion = "16.09";

}

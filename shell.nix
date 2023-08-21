{ pkgs ? import <nixpkgs> {} }:
  pkgs.mkShell {
    nativeBuildInputs = with pkgs.buildPackages; [ 
      ocaml 
      dune_3  
      ocamlPackages.menhir 
      coq 
      coqPackages.ITree 
      coqPackages.equations 
      coqPackages.flocq 
      coqPackages.coq-ext-lib 
      coqPackages.paco  
    ];
}
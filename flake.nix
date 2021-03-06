{
  description = ''Interpolation routines for data and animation.'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs."skinterpolate-master".dir   = "master";
  inputs."skinterpolate-master".owner = "nim-nix-pkgs";
  inputs."skinterpolate-master".ref   = "master";
  inputs."skinterpolate-master".repo  = "skinterpolate";
  inputs."skinterpolate-master".type  = "github";
  inputs."skinterpolate-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."skinterpolate-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib"];
  in lib.mkProjectOutput {
    inherit self nixpkgs;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
    refs = builtins.removeAttrs inputs args;
  };
}
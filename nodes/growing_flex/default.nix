{ agent, nodes, edges, crates, pkgs }:

agent {
  src = ./.;
  edges = with edges; [ core_action ];
  crates = with crates; [ rustfbp capnp ];
  osdeps = with pkgs; [];
  configurePhase = with nodes; ''
      substituteInPlace lib.rs --replace "ui_js_flex" "${flex}"
  '';
}

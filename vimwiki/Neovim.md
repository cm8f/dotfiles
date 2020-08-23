== Neovim infos

VHDL Language Server Tools

=== VHDL-TOOL
Install: 
  Download from homepage, move to ~/bin, add to PATH
  
Info:
  * easy to configure
  * Requires YAML File
  * Needs to be started with vhdl-tool server &
  * Tags update with vhdl-tool ctags -R
  * Bad VHDL 2008 Support
  * Fails to parse OSVVM, UVVM, VUnit etc.

=== rust_hdl
Install: 
  git clone <...>/rust_hdl.git
  cd rust_hdl
  cargo build --release
  
Configuration:

Info:
  * Could not get it to run reliable


=== hdl-checker

Install:
pip install hdl_checker

Info:
  * Requieres TOML file to specify source files and libraries

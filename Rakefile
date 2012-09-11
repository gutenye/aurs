def alias_task(new, old)
  task new, Rake::Task[old].arg_names => old
end

desc "release it to AUR site (alias r)"
task :release do
  Rake::Task["generate"].invoke

  run "makepkg -si"
  exit if $? != 0

  run "makepkg -Sf"
  puts "\nUploading..."
  run "burp *.src.tar.gz"

  Rake::Task["clean"].invoke
end

alias_task :r, :release

desc "install it to system (alias i)"
task :install do
  Rake::Task["generate"].invoke

  run "makepkg -sif"

  Rake::Task["clean"].invoke
end

alias_task :i, :install

desc "clean all generated pkgs (alias c)"
task :clean do
  `rm *.src.tar.gz &>/dev/null`
  `rm *.pkg.tar.xz &>/dev/null`
  `rm *.tar.gz &>/dev/null`
end

alias_task :c, :clean

desc "generate md5sum for PKGBUILD (alias g)"
task :generate do
  run %~sed -i '/md5sum/,$ d' PKGBUILD~, verbose: false
  run "makepkg -g >> PKGBUILD"
end

alias_task :g, :generate

desc "test the pkg (alias t)"
task :test do
  Rake::Task["generate"].invoke

  run "makepkg -sf"

  Rake::Task["clean"].invoke
end

alias_task :t, :test

def run(cmd, o={})
  o = {verbose: true}.merge(o)

  puts cmd if o[:verbose]
  system cmd
end

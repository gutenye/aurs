# tar zcvf ttf-mac-10.8.1-5.src.tar.gz ttf-mac -h
# tar zcvf ttf-mac-fonts.tar.gz ttf-mac-fonts -h

def alias_task(new, old)
  task new, Rake::Task[old].arg_names => old
end

desc "release it to AUR site (alias r)"
task :release do
  Rake::Task["generate"].invoke

  # remove old src packages
  run "rm *.src.tar.gz 2>/dev/null"

  # make sure tested
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
# src.tar.gz
# pkg.tar.xz
# tar.gz, tar.bz ..
task :clean do
  #`rm *.tar.* &>/dev/null`
end

alias_task :c, :clean

desc "generate md5sum for PKGBUILD (alias g)"
task :generate do
  if !@invoked_generate then
    puts "CAREFUL:: need remove download files before continue."
    run %~sed -i '/md5sum/,$ d' PKGBUILD~, verbose: false
    run "makepkg -g >> PKGBUILD"

    @invoked_generate = true
  end
end

alias_task :g, :generate

desc "test the pkg (alias t)"
task :test do
  Rake::Task["generate"].invoke

  run "makepkg -sf"

  Rake::Task["clean"].invoke
end

alias_task :t, :test

desc "build the pkg (alias b)"
task :build do
  Rake::Task["generate"].invoke

  run "makepkg -sf"
end

alias_task :b, :build

def run(cmd, o={})
  o = {verbose: true}.merge(o)

  puts cmd if o[:verbose]
  system cmd
end

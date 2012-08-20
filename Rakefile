task :release do
  `makepkg -Sf` 
  puts "\nUploading..."
  system "burp *.src.tar.gz"
  `rm *.src.tar.gz`

  Rake::Task["clean"].invoke
end

task :clean do
  `rm *.src.tar.gz &>/dev/null`
  `rm *.pkg.tar.xz &>/dev/null`
  `rm *.tar.gz &>/dev/null`
end

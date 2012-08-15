package() {
  cd $srcdir

  mkdir -p $pkgdir/etc/conf.d
  mkdir -p $pkgdir/etc/rc.d

  cp rc.foo $pkgdir/etc/rc.d/foo
  cp conf.foo $pkgdir/etc/conf.d/foo
}


# user-daemon
package() {
  p_root=$pkgdir/home/$USER
  cd $srcdir

  mkdir -p $p_root/etc/conf.d
  mkdir -p $p_root/etc/rc.d

  cp rc.foo $p_root/etc/rc.d/foo
  cp conf.foo $p_root/etc/conf.d/foo

  chown $USER:$USER -R $pkgdir
}

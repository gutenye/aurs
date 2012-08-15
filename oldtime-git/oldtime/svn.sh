_svntrunk="http://a/svn/trunk"
_svnmod="moban"

build() {
  cd $startdir/src

  msg "Connecting to SVN server...."
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi
  msg "SVN checkout done or server timeout"

  # msg "Starting make..."
  # svn export $_svnmod ${_svnmod}-build
  # cd ${_svnmod}-build
	# make
}

package() {
  cd $srcdir/$_svnmod
  #cd $srcdir/${_svnmod}-build

  chmod +x local/proxy.py

  #
  # install
  #

  mkdir -p $pkgdir/opt/moban
  cp -r * $pkgdir/opt/moban
}

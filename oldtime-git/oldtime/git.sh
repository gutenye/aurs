_gitroot="git://a.git"
_gitname="moban"

build() {
  cd ${srcdir}
  msg "Connecting to GIT server...."

  if [ -d ${_gitname}/.git ] ; then
    cd ${_gitname}

    # Change remote url to anongit
    if [ -z $( git branch -v | grep anongit ) ] ; then
        git remote set-url origin ${_gitroot}
    fi
    
    git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot} ${_gitname}
  fi
  msg "GIT checkout done or server timeout"

  # msg "Starting make..."
	# make
}

package() {
  p_plugins="${pkgdir}/srv/http/rutorrent/plugins"
  cd ${srcdir}/${_gitname}

  chmod +x local/proxy.py

  #
  # install
  #
  mkdir -p $pkgdir/opt/moban
  cp -r * $pkgdir/opt/moban

}

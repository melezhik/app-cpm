install_base=$(config install-base)
verbose=$(config verbose)
package=$(story_var package)

if test $verbose -eq 1; then
  flags="-v"
else
  flags=""
fi

export http_proxy=$(config http_proxy)
export https_proxy=$(config https_proxy)

if test -z $install_base; then
    echo install $package ...
    cpm install $flags -g $package || exit 1
else
    echo install $package into $install_base ...
    mkdir -p $install_base || exit 1
    cpm install $flags -L $install_base  $package || exit 1
fi

echo 'install ok'


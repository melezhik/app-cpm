install_base=$(config install-base)
package=$(story_var package)

export http_proxy=$(config http_proxy)
export https_proxy=$(config https_proxy)

if test -z $install_base; then
    echo install $package ...
    cpm -g $package || exit 1
else
    echo install $package into $install_base ...
    cpm -L $install_base  $package || exit 1
fi

echo 'install ok'


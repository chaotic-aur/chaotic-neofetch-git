# Maintainer: Dylan Araps <dyl@tfwno.gf>
# neofetch-git AUR PKGBUILD - https://aur.archlinux.org/packages/neofetch-git/
# Frogged by Tk-Glitch <tkg@froggi.es>
pkgname=chaotic-neofrog-git
_pkgname=neofetch
pkgver=7.1.0.r153.g4b91c943
pkgrel=1
pkgdesc="A CLI system information tool written in BASH that supports displaying images."
arch=('any')
url="https://github.com/dylanaraps/${_pkgname}"
license=('MIT')
provides=("$_pkgname=${pkgver}" "neofrog-git=${pkgver}")
conflicts=($_pkgname 'neofrog-git')
depends=('bash' 'awk')
optdepends=(
  'feh: Wallpaper Display'
  'imagemagick: Image cropping / Thumbnail creation / Take a screenshot'
  'nitrogen: Wallpaper Display'
  'w3m: Display Images'
  'catimg: Display Images'
  'jp2a: Display Images'
  'libcaca: Display Images'
  'xdotool: See https://github.com/dylanaraps/neofetch/wiki/Images-in-the-terminal'
  'xorg-xdpyinfo: Resolution detection (Single Monitor)'
  'xorg-xprop: Desktop Environment and Window Manager'
  'xorg-xrandr: Resolution detection (Multi Monitor + Refresh rates)'
  'xorg-xwininfo: See https://github.com/dylanaraps/neofetch/wiki/Images-in-the-terminal'
)
makedepends=('git')
source=("$pkgname::git+https://github.com/dylanaraps/neofetch.git"
        'frog.patch' 'chaotic.patch' 'chaotic-aur.sh')
md5sums=('SKIP'
         'a3fa5aeed248b78b27e351e3421d9ca5'
         '29be3803d8f3131e6f855be1ac958c95' '751a8c22bb3c79ac77d442f480f60a25')

pkgver() {
  cd "$pkgname"
  git describe --tags --long | sed -r -e 's,^[^0-9]*,,;s,([^-]*-g),r\1,;s,[-_],.,g'
}

prepare() {
  cd "$pkgname"

  patch -Np1 < "$srcdir"/frog.patch
  patch -Np1 < "$srcdir"/chaotic.patch
}

package() {
  cd "$pkgname"
  
  make DESTDIR="$pkgdir" install
  install -D -m644 LICENSE.md "$pkgdir/usr/share/licenses/neofetch/LICENSE.md"
  install -D -m755 ../chaotic-aur.sh "$pkgdir/usr/bin/chaotic-aur"
}

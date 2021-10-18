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
provides=()
conflicts=()
depends=('bash' 'awk' 'viu')
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
        'chaotic.patch' 'chaotic-aur.sh' 'logo.jpg')
md5sums=('SKIP'
        'abac215dbca3a8195d07e7d223ab7e98'
        'c66a52ad307423c090b77219acb0b5f6'
        '7b8f8e223e7271daf5d3b15cd9b39472')

pkgver() {
  cd "$pkgname"
  git describe --tags --long | sed -r -e 's,^[^0-9]*,,;s,([^-]*-g),r\1,;s,[-_],.,g'
}

prepare() {
  cd "$pkgname"

  patch -Np1 < "$srcdir"/chaotic.patch
}

package() {
  cd "$pkgname"
  
  make DESTDIR="$pkgdir" install
  install -D -m644 LICENSE.md "$pkgdir/usr/share/licenses/chaotic-neofetch/LICENSE.md"
  install -D -m644 ../logo.jpg "$pkgdir/usr/share/chaotic-aur/logo.jpg"
  install -D -m755 ../chaotic-aur.sh "$pkgdir/usr/bin/chaotic-aur"
}

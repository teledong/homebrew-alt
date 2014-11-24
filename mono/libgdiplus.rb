require 'formula'

class Libgdiplus < Formula
  homepage 'http://www.mono-project.com/Libgdiplus'
  url 'http://origin-download.mono-project.com/sources/libgdiplus/libgdiplus-2.10.tar.bz2'
  md5 '451966e8f637e3a1f02d1d30f900255d'

  depends_on 'gettext'
  depends_on 'libtiff'
  depends_on 'libexif'
  depends_on 'glib'

  def install
    ENV.x11
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end
end

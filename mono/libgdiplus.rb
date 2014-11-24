require 'formula'

class Libgdiplus < Formula
  homepage 'http://www.mono-project.com/Libgdiplus'
  url 'http://origin-download.mono-project.com/sources/libgdiplus/libgdiplus-2.10.tar.bz2'
  md5 '451966e8f637e3a1f02d1d30f900255d'

  depends_on 'gettext'
  depends_on 'libtiff'
  depends_on 'libexif'
  depends_on 'glib'

  # Fix compilation against libpng1.5. See:
  # https://bugs.gentoo.org/355113
  # https://bugzilla.novell.com/show_bug.cgi?id=666583
  def patches
    { :p0 =>
    'http://cvsweb.se.netbsd.org/cgi-bin/bsdweb.cgi/~checkout~/pkgsrc/graphics/libgdiplus/patches/patch-aa?rev=1.9;content-type=text%2Fplain'
    }
  end if MacOS.lion?

  def install
    ENV.x11
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end
end

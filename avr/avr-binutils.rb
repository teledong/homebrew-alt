require 'formula'

class AvrBinutils < Formula
  url 'http://ftp.gnu.org/gnu/binutils/binutils-2.21.tar.gz'
  homepage 'http://www.gnu.org/software/binutils/binutils.html'
  md5 'f11e10f312a58d82f14bf571dd9ff91c'

  def install
    # brew's build environment is in our way
    ENV.delete 'CFLAGS'
    ENV.delete 'CXXFLAGS'
    ENV.delete 'LD'
    ENV.delete 'CC'
    ENV.delete 'CXX'

    ENV['CPPFLAGS'] = "-I#{include}"

    args = ["--prefix=#{prefix}",
            "--infodir=#{info}",
            "--mandir=#{man}",
            "--disable-werror",
            "--disable-nls",
            "--target=avr" ]

    system "./configure", *args
    system "make"
    system "make install"
  end
end

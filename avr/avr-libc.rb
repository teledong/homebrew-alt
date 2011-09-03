require 'formula'

class AvrLibc < Formula
  url 'http://download.savannah.gnu.org/releases/avr-libc/avr-libc-1.7.1.tar.bz2'
  homepage 'http://www.nongnu.org/avr-libc/'
  md5 '8608061dcff075d44d5c59cb7b6a6f39'

  depends_on './avr-gcc'

  # brew's build environment is in our way
  ENV.delete 'CFLAGS'
  ENV.delete 'CXXFLAGS'
  ENV.delete 'LD'
  ENV.delete 'CC'
  ENV.delete 'CXX'

  def patches
    # fixes bug 32988 http://savannah.nongnu.org/bugs/?32988
    # This is fixed in upstream cvs
    DATA
  end

  def install
    avr_gcc = Formula.factory('./avr-gcc')
    build = `./config.guess`.chomp
    system "./configure", "--build=#{build}", "--prefix=#{prefix}", "--host=avr"
    system "make install"
    avr = File.join prefix, 'avr'
    # copy include and lib files where avr-gcc searches for them
    # this wouldn't be necessary with a standard prefix
    ohai "copying #{avr} -> #{avr_gcc.prefix}"
    cp_r avr, avr_gcc.prefix
  end
end

__END__
--- avr-libc-1.7.1/libc/stdlib/dtostre.c.orig	2011-08-17 15:32:07.000000000 +0200
+++ avr-libc-1.7.1/libc/stdlib/dtostre.c	2011-08-17 15:33:46.000000000 +0200
@@ -37,12 +37,12 @@
 char *
 dtostre (double val, char *sbeg, unsigned char prec, unsigned char flags)
 {
-    __attribute__((progmem)) static char str_nan[2][4] =
+    __attribute__((progmem)) static const char str_nan[2][4] =
 	{"nan", "NAN"};
-    __attribute__((progmem)) static char str_inf[2][sizeof(str_nan[0])] =
+    __attribute__((progmem)) static const char str_inf[2][sizeof(str_nan[0])] =
 	{"inf", "INF"};
     char *d;		/* dst	*/
-    char *s;		/* src	*/
+    const char *s;		/* src	*/
     signed char exp;
     unsigned char vtype;
 
--- avr-libc-1.7.1/include/avr/pgmspace.h.orig	2011-08-17 15:28:25.000000000 +0200
+++ avr-libc-1.7.1/include/avr/pgmspace.h	2011-08-17 15:29:08.000000000 +0200
@@ -252,7 +252,7 @@
 # define PSTR(s) ((const PROGMEM char *)(s))
 #else  /* !DOXYGEN */
 /* The real thing. */
-# define PSTR(s) (__extension__({static char __c[] PROGMEM = (s); &__c[0];}))
+# define PSTR(s) (__extension__({static const char __c[] PROGMEM = (s); &__c[0];}))
 #endif /* DOXYGEN */
 
 #define __LPM_classic__(addr)   \

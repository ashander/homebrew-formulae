require 'formula'

class Libtiff < Formula
  homepage 'http://www.remotesensing.org/libtiff/'
  url 'http://download.osgeo.org/libtiff/tiff-4.0.3.tar.gz'
  mirror 'ftp://ftp.remotesensing.org/pub/libtiff/tiff-4.0.3.tar.gz'
  sha256 'ea1aebe282319537fb2d4d7805f478dd4e0e05c33d0928baba76a7c963684872'

  option :universal
  option :cxx11

  depends_on 'jpeg'

  def install
    ENV.universal_binary if build.universal?
    ENV.cxx11 if build.cxx11?
    jpeg = Formula.factory('jpeg').opt_prefix
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--without-x",
                          "--disable-lzma",
                          "--with-jpeg-include-dir=#{jpeg}/include",
                          "--with-jpeg-lib-dir=#{jpeg}/lib"
    system "make install"
  end
end

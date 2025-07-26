class Ritual < Formula
  include Language::Python::Virtualenv

  desc "Cryptographic signing and verification CLI using PGPy"
  homepage "https://github.com/GeneXisD/ritual"
  url "https://github.com/GeneXisD/ritual/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "fcdffe341d504f103cd48575cdd2feeaab5e022cc0ab64147216b8d01dce7de2"
  license "MIT"

  depends_on "python@3.12"

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/ritual", "--help"
  end
end


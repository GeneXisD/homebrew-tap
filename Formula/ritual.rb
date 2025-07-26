class Ritual < Formula
  include Language::Python::Virtualenv

  desc "Cryptographic signing and verification CLI using PGPy"
  homepage "https://github.com/GeneXisD/ritual"
  url "https://github.com/GeneXisD/ritual/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "3ee4c63164789dc35d389293e30b2bb0d2c236f5d910fb8eb909f58d5114a450"
  license "MIT"

  depends_on "python@3.12"

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/ritual", "--help"
  end
end


class Ritual < Formula
  include Language::Python::Virtualenv

  desc "Portable CLI tool for cryptographic signing with PGPy"
  homepage "https://github.com/GeneXisD/ritual"
  url "https://github.com/GeneXisD/ritual/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "3ee4c63164789dc35d389293e30b2bb0d2c236f5d910fb8eb909f58d5114a450"
  version "0.1.1"
  license "GPL-3.0-or-later"

  depends_on "python@3.12"

  def install
    virtualenv_install_with_resources
    bin.install "ritual.py" => "ritual"
  end

  test do
    system "#{bin}/ritual", "--help"
  end
end





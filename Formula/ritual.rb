class Ritual < Formula
  include Language::Python::Virtualenv

  desc "Portable CLI tool for cryptographic signing with PGPy"
  homepage "https://github.com/GeneXisD/ritual"
  url "https://github.com/GeneXisD/ritual/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "db3b9fd959499f44d69a2218d3e246773ee39aef2795999d3221e8708a9d3680"
"
  version "1.0.0"
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





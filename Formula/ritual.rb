class Ritual < Formula
  desc "Cryptographic signing tool for SPDX, RFCs, and RitualMesh"
  homepage "https://github.com/GeneXisD/ritual"
  url "https://github.com/GeneXisD/ritual/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "055f46077de82eb4a40346ccb8057769f3efb8673a9fa3bc28e4aefe67d82aae"
  license "MIT"

  depends_on "python@3.12"

  def install
    bin.install "ritual.py" => "ritual"
  end

  test do
    system "#{bin}/ritual", "--help"
  end
end


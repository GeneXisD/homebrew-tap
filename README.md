# ritual
 Portable CLI for cryptographic signing and verification using PGPy — part of the RitualMesh system.
📜 ritual

Portable CLI for cryptographic signing and verification using PGPy
Part of the RitualMesh system · Designed by Victor Jose Corral (Metal Snake)

🔐 What is ritual?
ritual is a decentralized, lightweight command-line tool that allows anyone to:

✍️ Sign files (JSON, SPDX, RFC errata, poetry, etc.)
✅ Verify digital signatures using OpenPGP-compatible formats
🌍 Distribute signed content across global mesh networks or IPFS
🔗 Integrate authorship and identity into RitualMesh, SPDX, or legal systems
It uses the PGPy library — no GnuPG binary required.

✨ Why ritual?
This tool reclaims authorship, validates origin, and empowers creators in a world of:

Lost attribution
Centralized trust
Exploited content
🛠 Features
🔏 Sign files with portable .asc output
🔍 Verify OpenPGP .asc signatures
🧬 Embed RitualMesh metadata (--ritual-header)
🧠 Pure Python (no system gpg)
🪄 Designed for SPDX, RFC errata, poetry, and decentralized archives
🕸 IPFS-ready (optional pinning)
🧪 Shell completions (ritual.zsh)
🍺 Homebrew formula: brew install genexisd/tap/ritual
🚀 Quick Start
ritual sign --file document.json --key privatekey.asc --output document.json.asc
ritual verify --file document.json --sig document.json.asc
📦 Installation
Coming soon via:

pip install ritual-cli
brew install genexisd/tap/ritual
GitHub Releases
Docker: ghcr.io/genexisd/ritual
🔮 RitualMesh Integration
Use ritual to bind:

Signed SPDX software manifests
Authenticated poetry
Digital errata with verified origin
Node-based authorship in RitualMesh
🧙 Credits
Authored by Victor Jose Corral
Maintained by genexisd
Under the Metal Snake License (TBA)

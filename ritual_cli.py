#!/usr/bin/env python3
# ritual.py - Part of RitualMesh Authorship Trust Framework

import sys
import argparse
from pgpy import PGPKey, PGPMessage
import getpass
from pathlib import Path

RITUAL_HEADER = "Signed by RitualMesh Node :: Victor Jose Corral (Metal Snake)"

def sign(file_path, key_path, output_path, include_header=False):
    with open(key_path, 'r') as f:
        key, _ = PGPKey.from_blob(f.read())

    passphrase = getpass.getpass("🔑 Enter your key passphrase: ")
    key.unlock(passphrase)

    with open(file_path, 'r') as f:
        content = f.read()

    if include_header:
        content = f"/* {RITUAL_HEADER} */\n" + content

    msg = PGPMessage.new(content)
    sig = key.sign(msg)

    with open(output_path, 'w') as f:
        f.write(str(sig))

    print(f"✅ File signed and saved to: {output_path}")

def verify(file_path, sig_path):
    with open(file_path, 'r') as f:
        content = f.read()

    with open(sig_path, 'r') as f:
        sig = PGPMessage.from_blob(f.read())

    msg = PGPMessage.new(content)
    verified = False

    for key_file in Path('.').glob('*.asc'):
        try:
            key, _ = PGPKey.from_blob(key_file.read_text())
            if key.verify(msg, sig):
                print(f"✅ Signature verified with key: {key_file.name}")
                verified = True
                break
        except Exception:
            continue

    if not verified:
        print("❌ Verification failed. No matching key found or signature invalid.")

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description="🔏 ritual - Portable signing tool for RitualMesh")
    subparsers = parser.add_subparsers(dest='command')

    sign_parser = subparsers.add_parser('sign')
    sign_parser.add_argument('--file', required=True)
    sign_parser.add_argument('--key', required=True)
    sign_parser.add_argument('--output', required=True)
    sign_parser.add_argument('--ritual-header', action='store_true')

    verify_parser = subparsers.add_parser('verify')
    verify_parser.add_argument('--file', required=True)
    verify_parser.add_argument('--sig', required=True)

    args = parser.parse_args()

    if args.command == 'sign':
        sign(args.file, args.key, args.output, args.ritual_header)
    elif args.command == 'verify':
        verify(args.file, args.sig)
    else:
        parser.print_help()

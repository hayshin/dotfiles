# SOPS Cheatsheet

## Quick Reference

```bash
# Edit encrypted file (decrypts → edit → re-encrypts)
sops secrets/secrets.yaml

# Encrypt a plaintext file IN-PLACE
sops -e -i <file>

# Decrypt a file IN-PLACE (use with caution!)
sops -d -i <file>

# Encrypt to stdout (preview)
sops -e <file>

# Decrypt to stdout (preview)
sops -d <file>
```

## Your Setup

- **Key location:** `~/.config/sops/age/keys.txt`
- **Config:** `secrets/.sops.yaml`
- **Default secrets file:** `secrets/secrets.yaml`

## Common Workflows

### Add a new text secret to secrets.yaml

```bash
sops secrets/secrets.yaml
# Add your key: value, save and exit
```

### Re-encrypt after adding new keys

```bash
sops updatekeys secrets/secrets.yaml
sops updatekeys secrets/choco_vpn
```

### Generate new age key

```bash
age-keygen -o ~/.config/sops/age/keys.txt
# Add public key to .sops.yaml
```

### Get your public key

```bash
age-keygen -y ~/.config/sops/age/keys.txt
```

## Flags

| Flag | Description |
|------|-------------|
| `-e` | Encrypt |
| `-d` | Decrypt |
| `-i` | In-place (modify file directly) |
| `-k` | Specify key file |
| `--config` | Specify .sops.yaml location |

## Debugging

```bash
# Check which keys can decrypt a file
sops filestatus secrets/secrets.yaml

# Verbose output
sops -v -d secrets/secrets.yaml
```


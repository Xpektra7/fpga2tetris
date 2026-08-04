# Development Setup Guide

This document describes the tooling setup for fpga2tetris development.

## Verilog Linting with Verible

Verible provides the Verilog language server and linter for this project.

### Installation

```bash
# Linux
yay -S verible

# macOS
brew install verible
```

### Wrapper Script (vl)

A wrapper script `vl` is provided in the project root that runs `verible-verilog-lint` with the repo file list:

```bash
# Test from project root
./vl 01_Boolean_Logic/DMux4Way.v
```

### Verible File List

The root `verible.filelist` file lists all Verilog source directories so Verible can resolve modules across the tree.

### Zed Integration (Optional)

To use with Zed, add Verible to `~/.config/zed/settings.json`:

```json
{
  "languages": {
    "Verilog": {
      "language_servers": ["verible-verilog-ls"]
    }
  },
  "lsp": {
    "verible-verilog-ls": {
      "initialization_options": {
        "file_list_path": "verible.filelist"
      }
    }
  }
}
```

### VS Code Integration (Optional)

If you use VS Code, point your Verilog extension or LSP config at `verible-verilog-ls` and pass `verible.filelist` as the file list path.

### Neovim Integration (Optional)

If you use Neovim with `nvim-lspconfig`, configure the Verible server command to include `--file_list_path=verible.filelist`.

### Manual Usage

```bash
verible-verilog-lint --file_list_path=verible.filelist <path-to-file>
```

## APIO Simulation

The project uses APU (APIO) for FPGA simulation and synthesis.

```bash
# Run simulation for a specific exercise
apio sim
```

Each exercise folder (e.g., `01_Boolean_Logic/16_DMux4Way/`) contains:
- A testbench file (`*_tb.v`)
- An `Include.v` that lists all required modules

## Verilog Tips

- **Module instantiation requires instance names**:
  ```verilog
  DMux d1(in, sel[1], ch1, ch2);
  DMux d2(ch1, sel[0], a, b);
  DMux d3(ch2, sel[0], c, d);
  ```

- **Reduction operators** simplify wide OR/AND:
  ```verilog
  assign out = |in;  // OR all bits of in
  assign out = &in;  // AND all bits of in
  ```

- **Ternary operator** works element-wise on vectors:
  ```verilog
  assign out = sel ? b : a;  // selects entire 16-bit bus
  ```

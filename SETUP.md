# Development Setup Guide

This document describes the tooling setup for fpga2tetris development.

## Verilog Linting with Verilator

Verilator is used for Verilog linting. Note: Zed has a built-in Verilog language server, but it may have issues with this project's structure.

### Installation

```bash
# Linux
apt install verilator

# macOS
brew install verilator
```

### Wrapper Script (vl)

A wrapper script `vl` is provided in the project root that handles module discovery correctly:

```bash
# Test from project root
./vl 01_Boolean_Logic/DMux4Way.v
```

### Zed Integration (Optional)

To use with Zed, add to `~/.config/zed/settings.json`:

```json
{
  "languages": {
    "Verilog": {
      "enable_language_server": false
    }
  }
}
```

This disables Zed's built-in Verilog linter which may have issues. Use the `vl` script manually instead.

### Manual Usage

```bash
verilator --lint-only -y 01_Boolean_Logic <path-to-file>
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
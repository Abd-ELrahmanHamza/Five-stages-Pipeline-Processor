<div align="center">
<h1> MIPS-Microprocessor-Design </h1>
<p> A RISC-like, five-stages pipeline processor implemented using Verilog</p>
</div>

## 📝 Table of Contents

- [About](#About)
- [Built With](#Built-With)
- [Design](#Design)
- [ISA](#ISA)
- [Input signals](#Input-signals)
- [Control signals](#Control-signals)
- [Contributors](#Contributors)
- [License](#License)

# 📑 About

A RISC-like, five-stages pipeline processor implemented using Verilog ,It is based on the Reduced Instruction Set Computer (RISC) architecture, The five stages of the pipeline include instruction fetch, instruction decode, execution, memory access and write back. Each stage takes a single clock cycle to complete and the instructions are executed in parallel. This allows for faster execution of instructions compared to other architectures. Verilog is used to implement the processor.

## ⛏️Built with

- Verilog

## Design

### Non Pipelined

![Pipelined](Images/pipelined.png)

### Pipelined

![Non Pipelined](Images/nonpiplined.png)

## ISA

| Category          | Instruction | Opcode (Category) | Opcode (Number) | Source | Destination | Immediate value |
| ----------------- | ----------- | ----------------- | --------------- | ------ | ----------- | --------------- |
| Zero operand      | NOP         | 000               | 000000          | UUU    | UUUU        | U               |
| Zero operand      | SETC        | 000               | 000001          | UUU    | UUUU        | U               |
| Zero operand      | CLRC        | 000               | 000010          | UUU    | UUUU        | U               |
| ----------------- | ----------- | ----------------- | --------------- | ------ | ----------- | --------------- |
| One operand       | NOT         | 001               | 000000          | DDD    | DDDD        | U               |
| One operand       | INC         | 001               | 000001          | DDD    | DDDD        | U               |
| One operand       | DEC         | 001               | 000010          | DDD    | DDDD        | U               |
| One operand       | OUT         | 001               | 000011          | UUU    | DDDD        | U               |
| One operand       | IN          | 001               | 000100          | UUU    | DDDD        | U               |
| ----------------- | ----------- | ----------------- | --------------- | ------ | ----------- | --------------- |
| TWO operand       | MOV         | 010               | 000000          | DDD    | DDDD        | U               |
| TWO operand       | ADD         | 010               | 000001          | DDD    | DDDD        | U               |
| TWO operand       | SUB         | 010               | 000010          | DDD    | DDDD        | U               |
| TWO operand       | AND         | 010               | 000011          | DDD    | DDDD        | U               |
| TWO operand       | OR          | 010               | 000100          | DDD    | DDDD        | U               |
| TWO operand       | SHL         | 010               | 000101          | DDD    | DDDD        | U               |
| TWO operand       | SHR         | 010               | 000110          | DDD    | DDDD        | U               |
| TWO operand       | SHLI        | 010               | 000111          | DDD    | DDDD        | D               |
| TWO operand       | SHRI        | 010               | 001000          | DDD    | DDDD        | D               |
| TWO operand       | MOVI        | 010               | 001001          | DDD    | DDDD        | D               |
| TWO operand       | ADDI        | 010               | 001010          | DDD    | DDDD        | D               |
| TWO operand       | SUBI        | 010               | 001011          | DDD    | DDDD        | D               |
| TWO operand       | ANDI        | 010               | 001100          | DDD    | DDDD        | D               |
| TWO operand       | ORI         | 010               | 001101          | DDD    | DDDD        | D               |
| ----------------- | ----------- | ----------------- | --------------- | ------ | ----------- | --------------- |
| MEMORY operation  | PUSH        | 011               | 000000          | UUU    | DDDD        | U               |
| MEMORY operation  | POP         | 011               | 000001          | UUU    | DDDD        | U               |
| MEMORY operation  | LDM         | 011               | 000010          | UUU    | DDDD        | D               |
| MEMORY operation  | LDD         | 011               | 000011          | DDD    | DDDD        | U               |
| MEMORY operation  | STD         | 011               | 000100          | DDD    | DDDD        | U               |
| ----------------- | ----------- | ----------------- | --------------- | ------ | ----------- | --------------- |
| Control operation | JZ          | 100               | 000000          | UUU    | DDDD        | U               |
| Control operation | JN          | 100               | 000001          | UUU    | DDDD        | U               |
| Control operation | JC          | 100               | 000010          | UUU    | DDDD        | D               |
| Control operation | JMP         | 100               | 000100          | DDD    | DDDD        | U               |
| Control operation | CALL        | 100               | 000110          | DDD    | DDDD        | U               |
| Control operation | RET         | 100               | 001000          | UUU    | DDDD        | U               |
| Control operation | RTI         | 100               | 001010          | UUU    | DDDD        | U               |
| ----------------- | ----------- | ----------------- | --------------- | ------ | ----------- | --------------- |

## Input signals

| Signal    |
| --------- |
| Interrupt |
| reset     |

## Control signals
| Operation | ALU function | Branch | Data read | Data write | DMR | DMW | IOE | IOW | IOR | Stack operation | Push/Pop | pass_immediate | write_sp | rti | ret | call | branch_type|
| --------- | ------------ | ------ | --------- | ---------- | --- | --- | --- | --- | --- | --------------- | -------- | -------------- | -------- | --- | --- | ---- | ---------- |
| NOP         | 0000 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| SETC        | 0001 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| CLRC        | 0010 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| --------- | ------------ | ------ | --------- | ---------- | --- | --- | --- | --- | --- | --------------- | -------- | -------------- | -------- | --- | --- | ---- | ---------- |
| NOT         | 0101 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| INC         | 0110 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| DEC         | 0111 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| OUT         | 0011 | 0 | 1 | 0 | 0 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| IN          | 0000 | 0 | 0 | 1 | 0 | 0 | 0 | 1 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| --------- | ------------ | ------ | --------- | ---------- | --- | --- | --- | --- | --- | --------------- | -------- | -------------- | -------- | --- | --- | ---- | ---------- |
| MOV         | 0011 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| ADD         | 1000 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| SUB         | 1001 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| AND         | 1010 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| OR          | 1011 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| SHL         | 1100 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| SHR         | 1101 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| SHLI        | 1100 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 |
| SHRI        | 1101 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 |
| MOVI        | 0011 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 |
| ADDI        | 1000 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 |
| SUBI        | 1001 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 |
| ANDI        | 1010 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 |
| ORI         | 1011 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 |
| --------- | ------------ | ------ | --------- | ---------- | --- | --- | --- | --- | --- | --------------- | -------- | -------------- | -------- | --- | --- | ---- | ---------- |
| PUSH        | 0100 | 0 | 1 | 0 | 0 | 1 | 0 | 0 | 0 | 1 | 1 | 0 | 1 | 0 | 0 | 0 | 1 |
| POP         | 0000 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 1 | 0 | 0 | 0 | 1 |
| LDM         | 0011 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 |
| LDD         | 0011 | 0 | 1 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| STD         | 0011 | 0 | 1 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| --------- | ------------ | ------ | --------- | ---------- | --- | --- | --- | --- | --- | --------------- | -------- | -------------- | -------- | --- | --- | ---- | ---------- |
| JZ          | 0100 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 00 |
| JN          | 0100 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 01 |
| JC          | 0100 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 10 |
| JMP         | 0100 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 11 |
| CALL        | 0100 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 |
| RET         | 0000 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 |
| RTI         | 0000 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 |
| --------- | ------------ | ------ | --------- | ---------- | --- | --- | --- | --- | --- | --------------- | -------- | -------------- | -------- | --- | --- | ---- | ---------- |

## Contributors

<table>
  <tr>

<td align="center">
<a href="https://github.com/Abd-ELrahmanHamza" target="_black">
<img src="https://avatars.githubusercontent.com/u/68310502?v=4" width="150px;" alt="Abdelrahman Hamza"/><br /><sub><b>Abdelrahman Hamza</b></sub></a><br />
</td>

<td align="center">
<a href="https://github.com/ahmedmadbouly186" target="_black">
<img src="https://avatars.githubusercontent.com/u/66012617?v=4" width="150px;" alt="Ahmed Madbouly"/><br /><sub><b>Ahmed Madbouly</b></sub></a><br />
</td>

<td align="center">
<a href="https://github.com/Ahmedsabry11" target="_black">
<img src="https://avatars.githubusercontent.com/u/75908511?v=4" width="150px;" alt="Ahmed sabry"/><br /><sub><b>Ahmed Sabry</b></sub></a><br />
</td>

<td align="center">
<a href="https://github.com/AhmedAlaa2024" target="_black">
<img src="https://avatars.githubusercontent.com/u/62505107?v=4" width="150px;" alt="Ahmed Alaa"/><br /><sub><b>Ahmed Alaa</b></sub></a><br />
</td>

</tr>
 </table>

## License <a name = "license"></a>

> This software is licensed under MIT License, See [License](https://github.com/CMP24-SWE-TEAM3/Front-End/blob/main/LICENSE) .

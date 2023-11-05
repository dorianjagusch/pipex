# pipex

## Table of Contents
- [Project Description](#project-description)
- [Project Requirements](#project-requirements)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Usage](#usage)
- [How It Works](#how-it-works)

## Project Description

This project is designed to help you explore the inner workings of shell commands and piping. You will learn how to create a simplified version of the `pipe` command in Unix-like systems, allowing you to redirect the output of one command as the input to another command.
Doing pipex will develop your understanding of processes, file descriptors, and shell command execution, enabling you to build a program that can process command chains just like the shell.

## Project Requirements

- Read two input files, one for the input and one for the commands to be executed.
- Redirect the output of the first command to the input of the second command.
- Handle built-in and system commands, along with their arguments, and arbitrary binaries.
- Create child processes to execute the specified commands.
- Properly manage file descriptors and redirections between processes.

## Getting Started

Follow these instructions to get started with the Pipex project.

### Prerequisites

Before you begin, make sure you have the following prerequisites:

- A Linux-based system (the project is designed for Unix-like environments).
- GNU make
- GCC compiler

### Installation

1. Clone this repository to your local machine:

   ```sh
   git clone https://github.com/dorianjagusch/pipex.git
   ```

2. Compile the project:

     ```sh
     make
     ```

### Usage

To use Pipex, execute the program with the following command structure:
    
    ```sh
    ./pipex file1 cmd1 cmd2 file2
    ```

Where:

    file1 is the input file.
    cmd1 is the first command.
    cmd2 is the second command.
    file2 is the output file.

Pipex will execute cmd1 with file1 as input and redirect its output to cmd2, and finally, save the result in file2.

## Bonus

 In the bonus you can chain multiple commands together like so:

   ```sh
    ./pipex file1 cmd1 cmd2 cmd3 file2
   ```

  or
    ```sh
    ./pipex file1 cmd1 cmd2 cmd3 .... cmdn file2
     ```

## How It Works

Pipex works by creating child processes to execute the specified commands and managing file descriptors to redirect input and output between them. It emulates the behavior of the shell's pipe command by connecting the output of one command to the input of another.
To understand the inner workings of Pipex, you can explore the source code.

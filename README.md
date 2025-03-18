# RAM Management Utility

This utility is a PowerShell script compiled into an executable that automates the clearing of various memory caches on Windows systems using `RAMMap`, a Sysinternals tool. The utility targets several types of memory, including Working Sets, System Working Sets, Modified Page Lists, Standby Lists, and Priority 0 Standby Lists.

## Features

- **Automated Memory Clearing**: Simplifies the process of clearing system memory with predefined commands.
- **Easy to Use**: Run the executable with a double-click; no manual command line inputs required.
- **Admin Rights Handling**: Automatically requests administrative privileges if not already provided.

## Requirements

- **Windows Operating System**: Designed specifically for Windows.
- **Administrative Privileges**: Required to modify system memory settings.
- **RAMMap Tool**: Must be located in the same directory as the executable. RAMMap can be downloaded from [Sysinternals](https://docs.microsoft.com/en-us/sysinternals/downloads/rammap).

## Usage

1. **Download RAMMap**: Ensure `RAMMap.exe` is downloaded from the Sysinternals website and placed in the same directory as the `RAMManagementUtility.exe`.
2. **Run the Executable**: Double-click `RAMManagementUtility.exe` to start the process. The executable will request administrative privileges.
3. **Check the Logs**: If enabled, logs are generated in the same directory, providing details of operations and any errors encountered.

## Compilation from Source

If you prefer to compile the utility yourself from the PowerShell script (`ram.ps1`), follow these steps:

1. **Install PS2EXE**: Run `Install-Module -Name ps2exe` in PowerShell to install the PS2EXE module.
2. **Compile the Script**: Use the command below to compile the script:
   ```powershell
   Invoke-PS2EXE -inputFile "path_to_ram.ps1" -outputFile "path_to_output_exe" -requireAdmin
   ```
3. **Ensure `RAMMap.exe` is in the Same Directory**: Copy `RAMMap.exe` to the directory where your newly compiled executable resides.

## Contributions

Contributions are welcome! Please fork the repository and submit a pull request with your enhancements.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE.md) file for details.

## Acknowledgments

- Thanks to Sysinternals for providing `RAMMap`, an essential tool used in this utility.
- Appreciation to all contributors who have helped test and improve this utility.

## Disclaimer

Please read the [Disclaimer](DISCLAIMER.md) before using this utility.

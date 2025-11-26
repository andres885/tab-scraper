# Tab Scraper

A set of Bash scripts to scrape the content of all open Firefox tabs, clean repetitive headers, and merge everything into a single organized file.

## Features

- **scrap_tabs.sh**: Iterates through all open Firefox tabs and copies their content to individual text files. Uses `xdotool` and `xclip`. **The user must not change the window focus while the script is running**, as it automates keyboard and mouse input.
- **rm_head.sh**: Removes repetitive headers from each file using a predefined `head.txt` located in the same directory as the script and generated files.
- **mrg.sh**: Merges all cleaned files into a single file with proper headers. Run it in the same directory where the generated files are located.

## Requirements

- Bash
- `xdotool`
- `xclip`
- Mozilla Firefox

## Usage

1. Run `scrap_tabs.sh` to copy the content of all Firefox tabs into separate text files. **Do not switch windows or interact with the system during execution.**
2. Run `rm_head.sh` in the same directory as `head.txt` and the generated files to remove repetitive headers.
3. Run `mrg.sh` in the same directory as the cleaned files to merge them into a single output file.

```bash
./scrap_tabs.sh
./rm_head.sh
./mrg.sh
```

## Notes

- Make sure Firefox is running with the tabs you want to scrape.
- Adjust `head.txt` if the repeated header pattern changes.
- Scripts are designed for Linux systems with `xdotool` and `xclip` installed.

## License

This project is licensed under the MIT License. See [LICENSE](LICENSE) for more details.

## Author

Developed by [**X Software**](https://xsoftware.es)  
Linux software development, web solutions, and system automation.

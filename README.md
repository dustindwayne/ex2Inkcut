# CorelDRAW to Inkcut Macro (ex2Inkcut)

This VBA macro automates the process of sending selected shapes from CorelDRAW directly to Inkcut for vinyl cutting.  I created this because the paid software I was using for this purpose stopped working, and I believe paying for such a simple file transfer is unnecessary.

## Requirements

* CorelDRAW version 24.5 (and likely compatible with earlier versions, but tested on 24.5)
* Inkscape (for viewing/potential manual adjustments of the SVG if needed)
* Python (for Inkcut) - Inkcut is installed via Python.

## How to Use

1. Open the VBA editor in CorelDRAW (Alt + F11).
2. Import the `ex2Inkcut.cls` file (File > Import File...).
3. Select the shapes you want to cut in CorelDRAW.
4. Run the `ex2Inkcut` macro. You may need to run this from the VBA editor or assign it to a button/shortcut within CorelDRAW.

   **To add a button to a toolbar for easy access:**
   * Go to **Tools > Options > Customize > Commands**.
   * Navigate to the "Macros" category.
   * Select the `ex2Inkcut` macro.
   * Drag and drop it onto your preferred toolbar to create a custom button.

## Description

This macro exports the selected shapes as an SVG file to your temporary directory and then uses Inkcut (via Python) to send the file to your vinyl cutter.  It bypasses the need for dedicated (and often expensive) cutting software.

## Notes

* Make sure Inkcut is accessible via your system's PATH environment variable.  If it's not, you'll need to adjust the `inkscapeCmd` variable in the code to include the full path to the Inkcut executable.
* Error handling is included for export failures.
* This macro assumes your vinyl cutter is configured correctly within Inkcut.

## Disclaimer

Use this macro at your own risk.  I am not responsible for any damage to your vinyl cutter or computer.

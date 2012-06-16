# Introduction

The Hershey Track & Filed PDF Generator is a tool written in Ruby to be used by state meet coordinators to generate printable sheets for recording results for state meets.  It uses the Excel data that can be downloaded from the Hershey meet manager by using the Local/District Meet report. 

# Requirements

* Ruby 1.8.7-p334 or later
* (Gem) prawn 0.8.4 (Must use this version, haven't been ported to the newest version)
* (Gem) parseexcel 0.5.2
* (Gem) fastercsv (1.5.5)

# Usage

1. Login to the Hershey Meet Manager website and go to the tools section
2. Select the Local/District Meet Results report and click search
3. Check all the local events and click the Export Checked Items - Detail
4. (Important Step) Once you have the downloaded results, you MUST open in Excel and perform a Save As and change the "Save as Type" from "Web Page" to "Microsoft Excel Workbook."
5. Run the following command: ruby create_hershey_state_sheets.rb  <excel file>
6. The result will be files called <excel filename>_field_events.pdf and <excel filename>_running_events.pdf
  
# TODOs

* The tool requires the entire excel file when it only uses a few fields.  Update the tool to just search for the columns that are required
* Update to use the latest version of prawn (or some other Ruby PDF framework).  The latest version of prawn changed how they format tables
* Remove hardcode of the Meet Header
* Better handle when an event has more than 16 participants
* Better handle the relays
* Figure out how to parse the "web version" of the xls file that Hershey is generating or get Hershey to just generate a csv file instead
* Convert to a webapp that anyone can use

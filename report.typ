// Main report file
#import "template.typ": create-report-template, make-report, make-title-page

// Configure your report
#let my-report = create-report-template(
  // Required information
  logo: "./report/resources/img/unige.pdf", // Add path to your university logo: "path/to/logo.png"
  university: "University Name",
  title: "Report Title",
  authors: "Author Name 1 and Author Name 2",
  
  // Optional information
  faculty: "Faculty of Science", // Remove or set to none to hide
  subtitle: "Report Subtitle", // Remove or set to none to hide
  course-name: "Course Name", // Remove or set to none to hide
  course-id: "CS101", // Remove or set to none to hide
  illustrations: none, // Add array of image paths: ("img1.png", "img2.png")
  emails: "author1@email.com and author2@email.com", // Remove or set to none to hide
  github: "project-repo", // Remove or set to none to hide
  github-link: "https://github.com/username/project-repo", // Remove or set to none to hide
  date: "", // Set to none to use current date, or specify: "January 1, 2024"
  
  // Document options
  toc: true, // Set to false to hide table of contents
  numbering: true, // Set to false to hide section numbering
  bibliography: false, // Set to true to include bibliography section
  appendix: false, // Set to true to include appendix section
)

// Main content
#show: make-report.with(my-report)

// Your report content starts here
= Introduction

This is the introduction of your report.

= Methodology

Describe your methodology here.

== Data Collection

Details about data collection.

== Analysis

Details about analysis methods.

= Results

Present your results here.

= Conclusion

Conclude your report.

// Bibliography and Appendix will be added automatically if enabled

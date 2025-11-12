// Main report file
#import "template.typ": create-report-template, make-report

// Configure your report
#let my-report = create-report-template(
  // Required information
  logo: "./img/unige.pdf",
  logosize: 6cm,
  university: "University Name",
  title: "Report Title",
  
  // Structured authors
  authors: (
    (
      name: "Theresa Tungsten",
      affiliation: "Artos Institute",
      email: "tung@artos.edu",
    ),
    (
      name: "Eugene Deklan",
      // affiliation: "Honduras State",
      email: "e.deklan@hstate.hn",
    ),
  ),
  
  // Optional information
  faculty: "Faculty of Science",
  // subtitle: "Report Subtitle",
  course-name: "Course Name",
  course-id: "CS101",
  illustrations: (
    (
      path: "./img/unige_informatic.png",
      width: 4cm
    ),),
  project-name: "Project Name",
  github: "project-repo",
  github-link: "https://github.com/username/project-repo",
  date: none,

  // Document options
  toc: true,
  numbering: true,
  bibliography: false,
  appendix: false,
)

// Main content
#show: make-report.with(my-report)

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

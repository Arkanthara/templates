// Function to create a report template
#let create-report-template(
  // Required fields
  logo: none,
  university: none,
  title: none,
  authors: none,
  
  // Optional fields
  faculty: none,
  subtitle: none,
  course-name: none,
  course-id: none,
  illustrations: none,
  emails: none,
  github: none,
  github-link: none,
  date: none,
  
  // Options
  toc: false,
  numbering: true,
  bibliography: false,
  appendix: false,
) = {
  (
    logo: logo,
    university: university,
    title: title,
    authors: authors,
    faculty: faculty,
    subtitle: subtitle,
    course-name: course-name,
    course-id: course-id,
    illustrations: illustrations,
    emails: emails,
    github: github,
    github-link: github-link,
    date: date,
    toc: toc,
    numbering: numbering,
    bibliography: bibliography,
    appendix: appendix,
  )
}

// Title page styling
#let make-title-page(template) = {
  set align(center)
  set text(size: 12pt)
  
  // Logo
  if template.logo != none {
    image(template.logo, width: 8cm)
    v(1em)
  }
  
  // University
  if template.university != none {
    set text(size: 20pt, weight: "bold")
    [#template.university]
    v(0.5em)
  }
  
  // Faculty
  if template.faculty != none {
    set text(size: 16pt)
    [#template.faculty]
    v(1em)
  }
  
  // Title
  if template.title != none {
    set text(size: 28pt, weight: "bold")
    [#template.title]
    v(0.5em)
  }
  
  // Subtitle
  if template.subtitle != none {
    set text(size: 16pt)
    [#template.subtitle]
    v(1.5em)
  }
  
  // Course information
  if template.course-name != none {
    set text(size: 12pt)
    [#template.course-name]
    v(0.2em)
  }
  
  if template.course-id != none {
    [#template.course-id]
    v(1.5em)
  }
  
  // Illustrations
  if template.illustrations != none {
    grid(columns: 2, gutter: 1cm)[
      #for illustration in template.illustrations {
        image(illustration, width: 6cm)
      }
    ]
    v(1.5em)
  }
  
  // Authors
  if template.authors != none {
    set text(size: 12pt)
    [#template.authors]
    v(0.2em)
  }
  
  // Emails
  if template.emails != none {
    [#template.emails]
    v(0.2em)
  }
  
  // GitHub repository
  if template.github != none {
    if template.github-link != none {
      [GitHub: #link(template.github-link)[#template.github]]
    } else {
      [GitHub: #template.github]
    }
    v(1em)
  }
  
  // Date
  if template.date != none {
    [#template.date]
  } else {
    [#today()]
  }
  
  pagebreak()
}

// Main document function
#let make-report(template, body) = {
  // Apply numbering setting
  if template.numbering {
    set heading(numbering: "1.1")
  } else {
    set heading(numbering: none)
  }
  
  // Title page
  make-title-page(template)
  
  // Table of contents
  if template.toc {
    outline()
    pagebreak()
  }
  
  // Main content
  body
  
  // Bibliography
  if template.bibliography {
    pagebreak()
    [= Bibliography]
    // Add bibliography content here
  }
  
  // Appendix
  if template.appendix {
    pagebreak()
    [= Appendix]
    // Add appendix content here
  }
}

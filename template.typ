// Function to create a report template
#let create-report-template(
  // Required fields
  logo: none,
  logosize: none,
  university: none,
  title: none,
  authors: none,
  
  // Optional fields
  faculty: none,
  subtitle: none,
  course-name: none,
  course-id: none,
  illustrations: none,
  project-name: none,
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
    logosize: logosize,
    university: university,
    title: title,
    authors: authors,
    faculty: faculty,
    subtitle: subtitle,
    course-name: course-name,
    course-id: course-id,
    illustrations: illustrations,
    project-name: project-name,
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
  set text(size: 12pt, font: "Linux Biolinum O")
  
  // Logo
  if template.logo != none {
    if template.logosize != none { 
      image(template.logo, width: template.logosize)
    }
    else {
      image(template.logo, width: 8cm)
    }
    v(1em)
  }
  
  // University
  if template.university != none {
    set text(size: 20pt)
    smallcaps[#template.university]
    v(1em, weak: true)
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
    v(0.5em, weak: true)
  }
  
  // Subtitle
  if template.subtitle != none {
    v(1em, weak: true)
    set text(size: 16pt)
    [#template.subtitle]
    v(1.5em, weak: true)
  }
  
  // Course information
  if template.course-name != none {
    set text(size: 12pt)
    [#template.course-name]
    v(0.5em, weak: true)
  }
  
  if template.course-id != none {
    [#template.course-id]
    v(1.5em, weak: true)
  }
  
  // illustrations
  if template.illustrations != none {
    grid(columns: template.illustrations.len(), gutter: 1.5cm,
    ..template.illustrations.map(illustration => {
      if "width" in illustration [
        #image(illustration.path, width: illustration.width)
      ]
      else [
        #image(illustration.path, width: 5cm)
      ]

    }
    )
  )
    v(1.5em)
  }
  // Authors
  if template.authors != none {
    set text(size: 12pt)
    grid(columns: template.authors.len(), gutter: 1.5cm,
    ..template.authors.map(author => [
      #author.name \
      #if "affiliation" in author [
        #author.affiliation \
      ]
      #if "email" in author [
        #author.email
      ]]
    )
  )
    v(1em)
  }
  
  set align(bottom)
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
    [#datetime.today().display()]
  }
  
  pagebreak()
}

// Main document function
#let make-report(template, body) = {
  // Set basic document properties
  set document(
    author: if template.authors != none {
      template.authors.map(a => if "name" in a and a.name != none {a.name} else {""})
    } else {
      ""
    },
    title: template.title,
    date: if template.date != none { template.date } else { datetime.today() }
  )
  
  // Set page margins
  set page(margin: (top:3cm, bottom:3cm, left:3cm, right:2.5cm))
  
  // Set headers and footers - following the working example structure
  set page(
    header: context(
      if here().page() >= 2 [
        #set text(size: 10pt)
        #table(
          columns: (80%, 20%),
          stroke: none,
          inset: -0.5em,
          align: (x, y) => (left+bottom, right+top).at(x),
          [
            #if template.project-name != none {
              [#smallcaps[#template.project-name]]
            } #if template.project-name != none and template.title != none {[/]} #if template.title != none {
              [#smallcaps[#template.title]]
            }
          ],
          [
            #v(1.2cm)
            #if template.logo != none {
              [#image(template.logo, width: 2cm)]
            }
          ]
        )
        #if template.logo != none {
          [#line(start: (-0.5em, 0cm), length: 85%, stroke: 0.5pt)]
        } else {
          [#line(start: (-0.5em, 0cm), length: 100%, stroke: 0.5pt)]
        }
      ]
    ),
    footer: context(
      if here().page() >= 2 [
        #set text(size: 10pt)
        #line(start: (0%, 0cm), length: 100%, stroke: 0.5pt)
        #table(
          columns: (40%, 20%, 40%),
          stroke: none,
          inset: 0em,
          align: (x, y) => (left+top, center+top, right+top).at(x),
          [
            // Left: Authors
            #if template.authors != none and template.authors.len() > 0 {
              let author-names = template.authors.map(a => if "name" in a and a.name != none {a.name} else {""}).join(", ")
              [#author-names]
            }
          ],
          [
            // Center: Date
            #if template.date != none {
              [#template.date]
            } else {
              [#datetime.today().display("[year]")]
            }
          ],
          [
            // Right: Page number
            #counter(page).display("1 / 1", both: true)
          ]
        )
      ]
    )
  )

  // Apply numbering setting
  if template.numbering {
    set heading(numbering: "1.1")
  } else {
    set heading(numbering: none)
  }
  
  // Set font and styles
  set text(
    font: ("New Computer Modern", "Latin Modern", "Times New Roman"),
    size: 11pt
  )
  
  // Main body styling
  set par(justify: true)
  
  // Document content - all in one block
  [
    // Title page
    #make-title-page(template)
    
    // Table of contents
    #if template.toc {
      outline()
      pagebreak()
    }
    
    // Main content
    #body
    
    // Bibliography
    #if template.bibliography {
      pagebreak()
      [= Bibliography]
      // Add bibliography content here
    }
    
    // Appendix
    #if template.appendix {
      pagebreak()
      [= Appendix]
      // Add appendix content here
    }
  ]
}

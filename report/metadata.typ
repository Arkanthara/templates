//-------------------------------------
// Document options
//
#let option = (
  type : "final",
  //type : "draft",
  lang : "en",
  //lang : "de",
  //lang : "fr",
)
//-------------------------------------
// Optional generate titlepage image
//
#import "@preview/fractusist:0.1.1":*  // only for the generated images

#let titlepage_logo= dragon-curve(
  12,
  step-size: 10,
  stroke-style: stroke(
    //paint: gradient.linear(..color.map.rocket, angle: 135deg),
    paint: gradient.radial(..color.map.rocket),
    thickness: 3pt, join: "round"),
  height: 10cm,
)

//-------------------------------------
// Metadata of the document
//
#let doc= (
  title    : [*Report for Systems Engineering*],
  abbr     : "Prj",
  subtitle : [_Typst Template Example_],
  url      : "https://synd.hevs.io",
  logos: (
    tp_topleft  : image("resources/img/unige.pdf", height: 1.2cm),
    tp_topright : image("resources/img/unige_informatic.png", height: 1.5cm),
    // tp_main     : image("resources/img/unige.pdf", height: 5cm),
    header      : image("resources/img/unige.pdf", width: 2cm),
  ),
  authors: (
    (
      name        : "Michel Jean Joseph Donnet",
      abbr        : "MJJD",
      email       : "",
      // url         : "https://synd.hevs.io",
    ),
  ),
  school: (
    name        : "University of Geneva",
    major       : "Faculty of Sciences",
    orientation : "Informatics Department",
    // url         : "https://synd.hevs.io",
  ),
  course: (
    name     : "Digital Forensic",
    // url      : "https://course.hevs.io/did/eda-docs/",
    prof     : "Silvan Zahno",
    // class    : [S1f$alpha$],
    semester : "Fall Semester 2025",
  ),
  // keywords : ("Typst", "Template", "Report", "HEI-Vs", "Systems Engineering", "Infotronics"),
  // version  : "v0.1.0",
)

#let date= datetime.today()

//-------------------------------------
// Settings
//
#let tableof = (
  toc: true,
  tof: false,
  tot: false,
  tol: false,
  toe: false,
  maxdepth: 3,
)

#let gloss    = true
#let appendix = false
#let bib = (
  display : false,
  path  : "/tail/bibliography.bib",
  style : "ieee", //"apa", "chicago-author-date", "chicago-notes", "mla"
)

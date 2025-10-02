# How to use it ?

An example report with all useful informations is given for both `quarto` and `latex`

# Quarto

All is in `quarto` directory.

Install [Quarto](quarto.org).
If you look at the documentation, you can see that there is a vscode plugin for quarto.

To preview your report, execute

```{bash}
quarto preview report.qmd
```

To render your report, execute

```{bash}
quarto render report.qmd
```

The documentation for Quarto is available on the website [quarto.org](quarto.org)

Enjoy !

# Latex template

Use report and template in latex directory.

To compile, use this command

```{bash}
xelatex --shell-escape report.tex
```

> [!NOTE]
> The `--shell-escape` allow to download images from web
